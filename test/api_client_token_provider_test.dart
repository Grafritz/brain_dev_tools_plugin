import 'package:brain_dev_tools/config/api/api_client.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Appareil factice : `isPhysicalDevice` absent, donc aucun en-tête `device-*` n'est ajouté.
class _FakeDeviceInfo extends BaseDeviceInfo {
  _FakeDeviceInfo() : super(const <String, dynamic>{});
}

void main() {
  late List<http.Request> requests;

  Future<ApiClient> buildClient({Map<String, Object> prefs = const {}}) async {
    SharedPreferences.setMockInitialValues(prefs);
    return ApiClient(
      appBaseUrl: 'http://localhost',
      sharedPreferences: await SharedPreferences.getInstance(),
      deiceInfo: _FakeDeviceInfo(),
      uniqueId: 'test-device',
    );
  }

  /// Exécute [body] avec un client HTTP simulé qui mémorise les requêtes envoyées.
  Future<T> withMockHttp<T>(Future<T> Function() body) {
    requests = [];
    return http.runWithClient(body, () => MockClient((request) async {
          requests.add(request);
          return http.Response('{}', 200);
        }));
  }

  group('sans fournisseur externe (ancienne API)', () {
    test('garde le comportement actuel : jeton enregistré, en-tête brut', () async {
      final client = await buildClient(prefs: {'API_TOKEN_20241206': 'legacy-token'});

      await withMockHttp(() => client.getData('http://localhost/x'));

      expect(client.hasExternalTokenProvider, isFalse);
      // Les verbes getData/postData... ne relisent pas le jeton : l'en-tête reste celui construit à l'initialisation.
      expect(requests.single.headers['Authorization'], '');
    });

    test('getApiToken relit le jeton enregistré', () async {
      final client = await buildClient(prefs: {'API_TOKEN_20241206': 'legacy-token'});

      expect(await client.getApiToken(), 'legacy-token');
    });
  });

  group('avec un fournisseur externe (Keycloak)', () {
    test('préfixe le jeton par « Bearer » et le fournit à chaque verbe', () async {
      final client = await buildClient();
      client.accessTokenProvider = () async => 'kc-token';

      await withMockHttp(() async {
        await client.getData('http://localhost/get');
        await client.postData(apiUrl: 'http://localhost/post', data: {'a': 1});
        await client.putData(apiUrl: 'http://localhost/put', data: {'a': 1});
        await client.patchData(apiUrl: 'http://localhost/patch', data: {'a': 1});
        await client.deleteData(apiUrl: 'http://localhost/delete');
      });

      expect(requests, hasLength(5));
      for (final request in requests) {
        expect(request.headers['Authorization'], 'Bearer kc-token', reason: '${request.method} ${request.url}');
      }
    });

    test('relit le jeton avant CHAQUE appel : un jeton renouvelé n\'est jamais envoyé périmé', () async {
      final client = await buildClient();
      var calls = 0;
      client.accessTokenProvider = () async => 'token-${++calls}';

      await withMockHttp(() async {
        await client.getData('http://localhost/a');
        await client.getData('http://localhost/b');
      });

      expect(requests[0].headers['Authorization'], 'Bearer token-1');
      expect(requests[1].headers['Authorization'], 'Bearer token-2');
      expect(calls, 2);
    });

    test('utilisateur non connecté (null ou vide) : aucun jeton envoyé', () async {
      final client = await buildClient(prefs: {'API_TOKEN_20241206': 'legacy-token'});
      client.accessTokenProvider = () async => null;

      await withMockHttp(() => client.getData('http://localhost/x'));
      expect(requests.single.headers['Authorization'], '');

      client.accessTokenProvider = () async => '';
      await withMockHttp(() => client.getData('http://localhost/y'));
      expect(requests.single.headers['Authorization'], '');
    });

    test('ignore le jeton de l\'ancienne API enregistré dans les préférences', () async {
      final client = await buildClient(prefs: {'API_TOKEN_20241206': 'legacy-token'});
      client.accessTokenProvider = () async => 'kc-token';

      expect(await client.getApiToken(), 'Bearer kc-token');
      expect(client.bearerTokenExpirationDate, isEmpty);
      expect(client.hasExternalTokenProvider, isTrue);
    });
  });
}
