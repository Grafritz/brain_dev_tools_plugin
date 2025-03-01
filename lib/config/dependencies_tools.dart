
import 'package:brain_dev_tools/config/api/api_client.dart';
import 'package:brain_dev_tools/config/api/api_constant.dart';
import 'package:brain_dev_tools/config/api/api_http_client.dart';
import 'package:brain_dev_tools/controllers/application_controller.dart';
import 'package:brain_dev_tools/controllers/connectivity_controller.dart';
import 'package:brain_dev_tools/controllers/dynamic_link_controller.dart';
import 'package:brain_dev_tools/controllers/in_app_review_tools_controller.dart';
import 'package:brain_dev_tools/controllers/langue_controller.dart';
import 'package:brain_dev_tools/controllers/localization_controller.dart';
import 'package:brain_dev_tools/controllers/theme_controller.dart';
import 'package:brain_dev_tools/dao/my_shared_preferences.dart';
import 'package:brain_dev_tools/repository/device_app_version_repository.dart';
import 'package:brain_dev_tools/repository/settings_repository.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {}
}

/*Future<Map<String, Map<String, String>>>*/
initBrainDevToolsDependencies() async
{
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  final BaseDeviceInfo deviceInfo = await DeviceInfoPlugin().deviceInfo;

  //Get.lazyPut(() => AutoScrollController);
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => deviceInfo);
  //Get.lazyPut(() => firebaseMessaging);
  // Get.lazyPut(() => flutterLocalNotificationsPlugin);
  // Get.lazyPut(() => initializationSettingsAndroid);
  // Get.lazyPut(() => initializationIos);
  String uniqueId = '';
  try {
    uniqueId = const Uuid().v1();
    logCat('_uniqueId: $uniqueId');
  } catch (ex, trace) {
    logError(ex, trace: trace, position: 'Uuid');
  }

  Get.lazyPut(() => uniqueId);

  Get.lazyPut(() => ApiClient(
        //firebaseMessaging: Get.find(),
        appBaseUrl: ApiConstantDev.urlApiServer,
        sharedPreferences: Get.find(),
        uniqueId: Get.find(),
        deiceInfo: Get.find(),
      ));
//endregion
  //region DAO
  //Get.lazyPut(() => AdmobController(sharedPref: Get.find()));
  //Get.lazyPut(() => DataBaseUpgrade(pdlPlanDeLectureRepository: Get.find(), pdlCategoryRepository: Get.find()));
  //Get.lazyPut(() => DaoMaster());//dataBaseUpgrade: Get.find()));
  //endregion

  //region DAO
  //Get.lazyPut(() => QuestionsDao(daoMaster: Get.find(),), fenix: true);
//endregion

  //region DAO Pref
  Get.lazyPut(() => MySharedPreferences(), fenix: true);
  Get.lazyPut(() => MySharedPref(sharedPref: Get.find()), fenix: true);
  //Get.lazyPut(() => UserDaoPref(/*sharedPref: Get.find()*/), fenix: true);
  //Get.lazyPut(() => ChantUserDaoPref(sharedPref: Get.find()), fenix: true);
  //endregion

  //region Repository
  Get.lazyPut(() => ApiHttpClient(), fenix: true);
  Get.lazyPut(() => SettingsRepository(apiClient: Get.find()), fenix: true);
  // Get.lazyPut(
  //     () => NotificationRepository(flutterLocalNotificationsPlugin: Get.find()),
  //     fenix: true);
  //Get.lazyPut(() => UserRepository(apiClient: Get.find(), sharedPref: Get.find()), fenix: true);
  Get.lazyPut(() => DeviceAppVersionRepository(apiClient: Get.find()), fenix: true);
  //endregion

  //region Controller
  Get.lazyPut(() => DynamicLinkController(), fenix: true);
  Get.lazyPut(() => ConnectivityController(), fenix: true);
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()), fenix: true);
  Get.lazyPut(() => ApplicationController(
          apiClient: Get.find(),
          sharedPref: Get.find(),
          settingsRepository: Get.find(),
          deviceAppVersionRepository: Get.find()), fenix: true);
  Get.lazyPut(() => InAppReviewToolsController(), fenix: true);
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()), fenix: true);
  Get.lazyPut(() => LangueController(), fenix: true);
//endregion

  //region Model
  //Get.lazyPut(() => CategoryModel(), fenix: true);
  //endregion

  //region  Retrieving localized data
  // Map<String, Map<String, String>> languages = {};
  // for (LanguageModel language in L10n.languages) {
  //   String jsonStringValues = await rootBundle.loadString('assets/locale/app_${language.languageCode}.arb');
  //   Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
  //   Map<String, String> jsonData = {};
  //   mappedJson.forEach((key, value) {
  //     jsonData[key] = value.toString();
  //   });
  //   languages['${language.languageCode}_${language.countryCode}'] = jsonData;
  // }
  // return languages;
  //endregion
}
