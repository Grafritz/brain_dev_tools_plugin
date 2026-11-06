import 'package:brain_dev_tools/config/api/api_client.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeDeviceInfo extends BaseDeviceInfo {
  _FakeDeviceInfo() : super(const <String, dynamic>{});
}

void main() {
  late List<http.Request> sent;

  Future<ApiClient> buildClient() async {
    SharedPreferences.setMockInitialValues({});
    return ApiClient(
      appBaseUrl: 'http://localhost',
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

  test('sans fournisseur d\'attestation : aucun en-tête X-Firebase-AppCheck', () async {
    final client = await buildClient();

    await send(() => client.getData('http://localhost/x'));

    expect(sent.single.headers.containsKey(ApiClient.appCheckHeader), isFalse);
  });

  test('l\'attestation est envoyée par CHAQUE verbe', () async {
    final client = await buildClient();
    client.attestationProvider = () async => 'attest-1';

    await send(() async {
      await client.getData('http://localhost/get');
      await client.postData(apiUrl: 'http://localhost/post', data: {'a': 1});
      await client.putData(apiUrl: 'http://localhost/put', data: {'a': 1});
      await client.patchData(apiUrl: 'http://localhost/patch', data: {'a': 1});
      await client.deleteData(apiUrl: 'http://localhost/delete');
    });

    expect(sent, hasLength(5));
    expect(sent.map((r) => r.headers[ApiClient.appCheckHeader]), everyElement('attest-1'));
  });

  test('le jeton d\'attestation est relu avant chaque appel (il expire et se renouvelle)', () async {
    final client = await buildClient();
    var n = 0;
    client.attestationProvider = () async => 'attest-${++n}';

    await send(() async {
      await client.getData('http://localhost/a');
      await client.getData('http://localhost/b');
    });

    expect(sent[0].headers[ApiClient.appCheckHeader], 'attest-1');
    expect(sent[1].headers[ApiClient.appCheckHeader], 'attest-2');
  });

  test('sans compte : attestation seule, pas de jeton utilisateur (utilisation anonyme de l\'application)', () async {
    final client = await buildClient();
    client.attestationProvider = () async => 'attest-1';
    client.accessTokenProvider = () async => null;

    await send(() => client.getData('http://localhost/catalogue'));

    expect(sent.single.headers[ApiClient.appCheckHeader], 'attest-1');
    expect(sent.single.headers['Authorization'], '');
  });

  test('connecté : jeton utilisateur ET attestation partent ensemble', () async {
    final client = await buildClient();
    client.attestationProvider = () async => 'attest-1';
    client.accessTokenProvider = () async => 'kc-token';

    await send(() => client.getData('http://localhost/x'));

    expect(sent.single.headers['Authorization'], 'Bearer kc-token');
    expect(sent.single.headers[ApiClient.appCheckHeader], 'attest-1');
  });

  test('attestation indisponible (null) : l\'appel part sans l\'en-tête', () async {
    final client = await buildClient();
    client.attestationProvider = () async => null;

    await send(() => client.getData('http://localhost/x'));

    expect(sent.single.headers.containsKey(ApiClient.appCheckHeader), isFalse);
  });

  test('le fournisseur lève une erreur : l\'appel part quand même, sans l\'en-tête, sans planter', () async {
    final client = await buildClient();
    client.attestationProvider = () async => throw Exception('service Google indisponible');

    await send(() => client.getData('http://localhost/x'));

    expect(sent, hasLength(1));
    expect(sent.single.headers.containsKey(ApiClient.appCheckHeader), isFalse);
  });

  test('une attestation périmée n\'est pas réutilisée quand le fournisseur échoue ensuite', () async {
    final client = await buildClient();
    var fail = false;
    client.attestationProvider = () async => fail ? throw Exception('x') : 'attest-1';

    await send(() => client.getData('http://localhost/a'));
    fail = true;
    await send(() => client.getData('http://localhost/b'));

    expect(sent.single.headers.containsKey(ApiClient.appCheckHeader), isFalse);
  });

  group('extraHeaders (en-têtes propres à un appel)', () {
    test('partent avec l\'appel demandé, avec les en-têtes habituels', () async {
      final client = await buildClient();
      client.attestationProvider = () async => 'attest-1';

      await send(() => client.getData('http://localhost/x', extraHeaders: {'If-None-Match': '"abc"'}));

      expect(sent.single.headers['If-None-Match'], '"abc"');
      expect(sent.single.headers[ApiClient.appCheckHeader], 'attest-1');
    });

    test('ne contaminent JAMAIS les appels suivants (la carte d\'en-têtes de l\'ApiClient est partagée)', () async {
      final client = await buildClient();

      await send(() => client.getData('http://localhost/a', extraHeaders: {'If-None-Match': '"abc"'}));
      await send(() => client.getData('http://localhost/b'));
      expect(sent.single.headers.containsKey('If-None-Match'), isFalse);

      await send(() => client.postData(apiUrl: 'http://localhost/c', data: {'a': 1}));
      expect(sent.single.headers.containsKey('If-None-Match'), isFalse);
    });
  });
}
