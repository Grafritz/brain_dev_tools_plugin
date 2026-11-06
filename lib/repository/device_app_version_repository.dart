import 'package:brain_dev_tools/config/api/api_client.dart';
import 'package:brain_dev_tools/config/api/api_constant.dart';
import 'package:brain_dev_tools/models/security/device_app_version_model.dart';
import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class DeviceAppVersionRepository {
  ApiClient apiClient;

  /// Plateforme de l'appareil pour la fiche de version (`android` / `ios` / `null`) ; remplaçable pour les tests.
  final String? Function() platformProvider;

  DeviceAppVersionRepository({required this.apiClient, String? Function()? platformProvider})
      : platformProvider = platformProvider ?? (() => CheckPlatform().versionSheetPlatform);

  /// Fiche de version du serveur pour CETTE application sur CETTE plateforme : Android et iOS peuvent avoir des builds
  /// (et des mises à jour obligatoires) différents. Modèle vide, jamais null, si la fiche est introuvable ou en erreur.
  Future<DeviceAppVersionModel> getDeviceAppVersionByPackageName() async {
    try {
      String packageName = apiClient.packageInfo!.packageName;
      String apiUrl = ApiConstantDev.urlMiddlewareAppVersion(packageName: packageName, platform: platformProvider());
      var response = await apiClient.getData(apiUrl, fName: 'getDeviceAppVersionByPackageName');
      if (response.statusCode == HttpStatus.ok) {
        return deviceAppVersionFromJson(response.body);
      }
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'getDeviceAppVersionByPackageName');
    }
    return DeviceAppVersionModel();
  }
}
