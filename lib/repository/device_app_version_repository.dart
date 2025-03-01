
import 'package:brain_dev_tools/config/api/api_client.dart';
import 'package:brain_dev_tools/config/api/api_constant.dart';
import 'package:brain_dev_tools/models/security/device_app_version_model.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class DeviceAppVersionRepository {
  ApiClient apiClient;

  DeviceAppVersionRepository({required this.apiClient});

  Future getDeviceAppVersionByPackageName() async {
    try {
      String packageName = apiClient.packageInfo!.packageName;
      String apiUrl = ApiConstantDev.urlApiDeviceAppVersion(packageName: packageName);
      var response = await apiClient.getData(apiUrl, fName: 'getDeviceAppVersionByPackageName');
      if (response.statusCode == HttpStatus.ok) {
        return deviceAppVersionFromJson(response.body);
      }
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'getDeviceAppVersionByPackageName');
      return DeviceAppVersionModel();
    }
  }
}
