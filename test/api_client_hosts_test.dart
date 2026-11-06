import 'package:brain_dev_tools/config/api/api_client.dart';
import 'package:brain_dev_tools/tools/constant.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeDeviceInfo extends BaseDeviceInfo {
  _FakeDeviceInfo() : super(const <String, dynamic>{});
}

const _middleware = 'https://middleware.test/api/x';
const _legacy = 'https://api-ancienne.test/api/v1/y';

void main() {
  late List<http.Request> sent;

  Future<ApiClient> buildClient({String legacyToken = 'Bearer ANCIEN'}) async {
    SharedPreferences.setMockInitialValues({Constant.API_TOKEN: legacyToken});
    return ApiClient(
      appBaseUrl: 'https://api-ancienne.test',
      sharedPreferences: await SharedPreferences.getInstance(),
      deiceInfo: _FakeDeviceInfo(),
      uniqueId: 'test-device',
    );
  }

  Future<void> send(Future<dynamic> Function() call) {
    sent = [];
    return http.runWithClient(call, () => MockClient((request) async {
          sent.add(request);
          return http.Response('{}', 200);
        }));
  }

  Future<ApiClient> hostAwareClient({String? keycloakToken = 'KC'}) async {
    final client = await buildClient();
    client.accessTokenProvider = () async => keycloakToken;
    client.attestationProvider = () async => 'ATTEST';
    client.externalAuthHosts = {'middleware.test'};
    return client;
  }

  group('avec des hôtes précisés (l\'ancienne API garde son propre jeton)', () {
    test('le Middleware reçoit le jeton Keycloak ET l\'attestation', () async {
      final client = await hostAwareClient();

      await send(() => client.getData(_middleware));

      expect(sent.single.headers['Authorization'], 'Bearer KC');
      expect(sent.single.headers[ApiClient.appCheckHeader], 'ATTEST');
    });

    test('l\'ancienne API reçoit SON jeton, et ni le jeton Keycloak ni l\'attestation', () async {
      final client = await hostAwareClient();

      await send(() => client.getData(_legacy));

      expect(sent.single.headers['Authorization'], 'Bearer ANCIEN');
      expect(sent.single.headers.containsKey(ApiClient.appCheckHeader), isFalse);
      expect(sent.single.headers.values.join(), isNot(contains('KC')));
    });

    test('tous les verbes appliquent la règle de l\'hôte', () async {
      final client = await hostAwareClient();

      await send(() async {
        await client.postData(apiUrl: _middleware, data: {'a': 1});
        await client.putData(apiUrl: _legacy, data: {'a': 1});
        await client.patchData(apiUrl: _middleware, data: {'a': 1});
        await client.deleteData(apiUrl: _legacy);
      });

      expect(sent.map((r) => r.headers['Authorization']), ['Bearer KC', 'Bearer ANCIEN', 'Bearer KC', 'Bearer ANCIEN']);
      expect(sent.map((r) => r.headers.containsKey(ApiClient.appCheckHeader)), [true, false, true, false]);
    });

    test('`bearerToken` (celui de l\'ancienne API) n\'est jamais écrasé par le jeton Keycloak', () async {
      final client = await hostAwareClient();
      client.bearerToken = 'Bearer ANCIEN';

      await send(() => client.getData(_middleware));

      expect(client.bearerToken, 'Bearer ANCIEN');
    });

    test('utilisateur non connecté : le Middleware reçoit quand même l\'attestation (usage sans compte)', () async {
      final client = await hostAwareClient(keycloakToken: null);

      await send(() => client.getData(_middleware));

      expect(sent.single.headers['Authorization'], '');
      expect(sent.single.headers[ApiClient.appCheckHeader], 'ATTEST');
    });

    test('un fournisseur de jeton qui échoue n\'empêche pas l\'appel', () async {
      final client = await hostAwareClient();
      client.accessTokenProvider = () async => throw Exception('Keycloak injoignable');

      await send(() => client.getData(_middleware));

      expect(sent, hasLength(1));
      expect(sent.single.headers['Authorization'], '');
    });

    test('l\'hôte doit correspondre exactement (un sous-domaine ou un hôte voisin ne reçoit rien)', () async {
      final client = await hostAwareClient();

      await send(() => client.getData('https://evil-middleware.test/x'));
      expect(sent.single.headers['Authorization'], 'Bearer ANCIEN');

      await send(() => client.getData('https://middleware.test.evil.com/x'));
      expect(sent.single.headers['Authorization'], 'Bearer ANCIEN');
      expect(sent.single.headers.containsKey(ApiClient.appCheckHeader), isFalse);
    });

    test('externalTokenReplacesLegacy est faux : l\'ancienne authentification doit continuer', () async {
      final client = await hostAwareClient();

      expect(client.hasExternalTokenProvider, isTrue);
      expect(client.externalTokenReplacesLegacy, isFalse);
    });
  });

  group('sans hôte précisé (comportement d\'origine)', () {
    test('tous les hôtes reçoivent le jeton Keycloak et l\'attestation', () async {
      final client = await buildClient();
      client.accessTokenProvider = () async => 'KC';
      client.attestationProvider = () async => 'ATTEST';

      await send(() async {
        await client.getData(_middleware);
        await client.getData(_legacy);
      });

      expect(sent.map((r) => r.headers['Authorization']), ['Bearer KC', 'Bearer KC']);
      expect(client.externalTokenReplacesLegacy, isTrue);
    });

    test('sans fournisseur : le jeton enregistré, comme avant (lu au démarrage par getApiToken)', () async {
      final client = await buildClient();
      await client.getApiToken(); // ce que fait l'application au démarrage (tryTokenAutoAuthenticate)

      await send(() => client.getData(_legacy));

      expect(sent.single.headers['Authorization'], 'Bearer ANCIEN');
      expect(client.externalTokenReplacesLegacy, isFalse);
    });
  });
}
