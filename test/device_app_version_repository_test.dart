import 'package:brain_dev_tools/config/api/api_client.dart';
import 'package:brain_dev_tools/config/api/api_constant.dart';
import 'package:brain_dev_tools/repository/device_app_version_repository.dart';
import 'package:brain_dev_tools/tools/constant.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeDeviceInfo extends BaseDeviceInfo {
  _FakeDeviceInfo() : super(const <String, dynamic>{});
}

const _package = 'net.braindev.chantdesperance';

/// Le contrôle de mise à jour demande la fiche de SA plateforme : Android et iOS peuvent avoir des builds différents.
void main() {
  late List<http.Request> sent;

  Future<DeviceAppVersionRepository> build({String? platform}) async {
    SharedPreferences.setMockInitialValues({Constant.API_TOKEN: 'Bearer X'});
    final client = ApiClient(
      appBaseUrl: 'https://api-ancienne.test',
      sharedPreferences: await SharedPreferences.getInstance(),
      deiceInfo: _FakeDeviceInfo(),
      uniqueId: 'test-device',
    );
    client.packageInfo = PackageInfo(appName: 'Test', packageName: _package, version: '3.0.14', buildNumber: '110');
    return DeviceAppVersionRepository(apiClient: client, platformProvider: () => platform);
  }

  Future<T> run<T>(Future<T> Function() call, {int status = 200, String body = '{"buildNumber":120,"versionName":"3.1.0"}'}) {
    sent = [];
    return http.runWithClient(call, () => MockClient((request) async {
          sent.add(request);
          return http.Response(body, status, headers: {'content-type': 'application/json'});
        }));
  }

  test("Android : la requête porte ?platform=android et la fiche lue est celle renvoyée", () async {
    final repository = await build(platform: 'android');

    final model = await run(() => repository.getDeviceAppVersionByPackageName());

    expect(sent.single.url.path, endsWith('api/app-versions/$_package'));
    expect(sent.single.url.queryParameters['platform'], 'android');
    expect(model.buildNumber, 120);
  });

  test("iOS : la requête porte ?platform=ios", () async {
    final repository = await build(platform: 'ios');

    await run(() => repository.getDeviceAppVersionByPackageName());

    expect(sent.single.url.queryParameters['platform'], 'ios');
  });

  test("plateforme inconnue (web, bureau) : aucun paramètre, donc la fiche « toutes plateformes »", () async {
    final repository = await build(platform: null);

    await run(() => repository.getDeviceAppVersionByPackageName());

    expect(sent.single.url.hasQuery, isFalse);
  });

  test("fiche introuvable (404) : modèle vide, jamais null", () async {
    final repository = await build(platform: 'android');

    final model = await run(() => repository.getDeviceAppVersionByPackageName(), status: 404, body: '{}');

    expect(model.buildNumber, 0);
  });

  test("erreur du serveur (500) : modèle vide, jamais null (l'ancien code renvoyait null)", () async {
    final repository = await build(platform: 'ios');

    final model = await run(() => repository.getDeviceAppVersionByPackageName(), status: 500, body: 'oops');

    expect(model.buildNumber, 0);
  });

  group('adresse', () {
    test('sans plateforme ou plateforme vide : adresse inchangée', () {
      final plain = ApiConstantDev.urlMiddlewareAppVersion(packageName: _package);

      expect(ApiConstantDev.urlMiddlewareAppVersion(packageName: _package, platform: ''), plain);
      expect(plain, isNot(contains('?')));
    });

    test('avec plateforme : paramètre de requête encodé', () {
      expect(ApiConstantDev.urlMiddlewareAppVersion(packageName: _package, platform: 'ios'), endsWith('$_package?platform=ios'));
    });
  });
}
