
import 'package:brain_dev_tools/config/api/api_client.dart';
import 'package:brain_dev_tools/config/api/api_constant.dart';
import 'package:brain_dev_tools/models/settings_model.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class SettingsRepository {
  ApiClient apiClient;

  SettingsRepository({required this.apiClient});

  // Get the privacy policy from the backend
  Future fetchSettings() async {
    try {
      String apiUrl = ApiConstantDev.urlApiSettings;
      var response = await apiClient.getData(apiUrl, fName: 'fetchSettings');
      if (response.statusCode == HttpStatus.ok) {
        return settingsFromJson(response.body);
      }
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'fetchSettings');
      return null;
    }
  }
}
