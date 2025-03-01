// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:brain_dev_tools/config/api/api_client.dart';
import 'package:brain_dev_tools/repository/device_app_version_repository.dart';
import 'package:brain_dev_tools/repository/settings_repository.dart';
import 'package:brain_dev_tools/views/base/dialog_reminder_update.dart';
import 'package:brain_dev_tools/models/security/device_app_version_model.dart';
import 'package:brain_dev_tools/models/settings_model.dart';
import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/constant.dart';
// import 'package:brain_dev_tools/tools/my_launcher.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationController extends GetxController implements GetxService {

  //final storage = const FlutterSecureStorage();
  final SharedPreferences sharedPref;

  //MySharedPref mySharedPref;
  ApiClient apiClient;
  DeviceAppVersionRepository deviceAppVersionRepository;
  SettingsRepository settingsRepository;

  ApplicationController(
      {required this.apiClient,
      required this.sharedPref,
      required this.settingsRepository,
      required this.deviceAppVersionRepository}) {
    initData();
  }

  //region [ Db Bible ]
  Future<bool> getIsDbBibleChange() async {
    return sharedPref.getBool("getIsDbBibleChange") ?? false;
  }
  setIsDbBibleChange(bool value) async {
    sharedPref.setBool("getIsDbBibleChange", value);
  }
  Future<bool> getIsDbBibleChange2() async {
    return sharedPref.getBool("getIsDbBibleChange2") ?? false;
  }
  setIsDbBibleChange2(bool value) async {
    sharedPref.setBool("getIsDbBibleChange2", value);
  }
  Future<bool> getIsFirstDbBibleCopy() async {
    return sharedPref.getBool("getIsFirstDbBibleCopy") ?? false;
  }
  setIsFirstDbBibleCopy(bool value) async {
    sharedPref.setBool("getIsFirstDbBibleCopy", value);
  }
  Future<bool> getIsNewFirstDbBibleCopy() async {
    return sharedPref.getBool("getIsNewFirstDbBibleCopy12") ?? false;
  }
  setIsNewFirstDbBibleCopy(bool value) async {
    sharedPref.setBool("getIsNewFirstDbBibleCopy12", value);
  }
  getDbNameBible() async {
    String data = sharedPref.getString("DbNameBible") ?? Constant.defaultDbNameBible;
    return data;
  }
  Future<String> getDbNameBibleWithOutExtension() async {
    var data = await getDbNameBible();
    return data.replaceAll('.db', '');
  }
  setDbNameBible(String value) async {
    sharedPref.setString("DbNameBible", value);
  }
  Future<String> getDbNameBible2() async {
    var data = sharedPref.getString("DbNameBible2") ?? Constant.defaultDbNameBible;
    return data;
  }
  setDbNameBible2(String value) async {
    sharedPref.setString("DbNameBible2", value);
  }
  //endregion

//region [ Is A ListView ]
  bool isAListViewMenuChant = false;
  getIsAListViewMenuChant() {
    isAListViewMenuChant = sharedPref.getBool("IsAListViewMenuChant") ?? false;
    update();
    //return isAListViewMenuChant;
  }
  setIsAListViewMenuChant()  {
    isAListViewMenuChant = !isAListViewMenuChant;
    sharedPref.setBool("IsAListViewMenuChant", isAListViewMenuChant);
    update();
  }
  //endregion

  //region mySharedPref
  //MySharedPref get getMySharedPref => mySharedPref;
  //endregion

  //region [ dataResult ]
  List? _dataResult = [];

  List? get dataResult => _dataResult;

  set dataResult(List? val) {
    _dataResult = val;
    update();
  }

  //endregion
  //region [ showSearch ]
  bool _showSearch = false;

  bool get showSearch => _showSearch;

  set showSearch(bool val) {
    _showSearch = val;
    update();
  }

  //endregion

  //region [ checkIsFirstBackUpOnline ]
  bool _checkIsFirstBackUpOnline = false;

  bool get checkIsFirstBackUpOnline => _checkIsFirstBackUpOnline;

  set checkIsFirstBackUpOnline(bool value) {
    _checkIsFirstBackUpOnline = value;
    sharedPref.setBool("checkIsFirstBackUpOnline", value);
    update();
  }

  checkFirstBackUpOnline() async {
    _checkIsFirstBackUpOnline =
        sharedPref.getBool('checkIsFirstBackUpOnline') ?? false;
    update();
  }
  //endregion

  //region [ showCircularProgressIndicator ]
  bool _showCircularProgress = false;

  bool get showCircularProgress => _showCircularProgress;

  showCircularProgressIndicator({bool show = true}) {
    _showCircularProgress = show;
    //update();
  }

  showDialogProgress({bool show = true}) =>
      showCircularProgressIndicator(show: show);
  //endregion

  //region Home NavBottomBar
  int selectedTabHomePageIndex = 0;
  void selectTabHomePageIndex(int index) {
    selectedTabHomePageIndex = index;
    update();
  }
  int selectedTabHomePageIndexV2 = 0;
  void selectTabHomePageIndexV2(int index) {
    selectedTabHomePageIndexV2 = index;
    update();
  }
  //endregion

  //region Settings
  int selectedTabPageIndex = 0;
  void selectPage(int index) {
    selectedTabPageIndex = index;
    update();
  }
  //endregion

  //region Settings
  SettingsModel settings = SettingsModel(id: '');
  //endregion

  //region Settings
  //List<Language> languages = [];
  //endregion

  //region [ counter ]
  int _counter = 0;

  int get counter => _counter;

  set counter(int index) {
    _counter = index;
    update();
  }

  //region [ Duration ]
  Duration _duration = Duration.zero;

  Duration get duration => _duration;

  set duration(Duration index) {
    _duration = index;
    update();
  }

  //endregion

  //region [ App info ]
  PackageInfo _packageInfo =
      PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');

  PackageInfo get packageInfo => _packageInfo;

  //endregion

  initData() async {
    //Get.find<ConnectivityController>().setIsInternetOk(true);
    await initPackageState();
    getFormatListOrGrid();
    checkFirstBackUpOnline();
    getIsShowBottomNavigationBarMenu();
    getIsAListViewMenuChant();
    //getIsModeOfflineActivate();
    //Get.find<AdmobController>().getRecompenseAds();
    //Get.find<AdmobController>().getRecompenseAdsQR();
  }

  //region [ getIsShowBottomNavigationBarOptions ]
  bool _isShowBottomNavigationBarMenu=true;
  bool get isShowBottomNavigationBarMenu => _isShowBottomNavigationBarMenu;
  getIsShowBottomNavigationBarMenu() async {
    _isShowBottomNavigationBarMenu= sharedPref.getBool("IsShowBottomNavigationBarMenu") ?? true;
    update();
  }
  setIsShowBottomNavigationBarMenu(bool value) {
    _isShowBottomNavigationBarMenu=value;
    sharedPref.setBool("IsShowBottomNavigationBarMenu", value);
    update();
  }
  //endregion
  //endregion

  initPackageState() async {
    _packageInfo = await CheckPlatform().getPackageData();
    apiClient.packageInfo = _packageInfo;
    update();
  }

  Future fetchSettings() async {
    _showCircularProgress = true;
    if (settings.id.isNotEmpty) {
      return;
    }
    if (settings.id.isEmpty) {
      var data = await settingsRepository.fetchSettings();
      if (data != null) settings = data;
    }
    _showCircularProgress = false;
    update();
  }

  Future fetchLanguages() async {
    // if (languages.isNotEmpty) {
    //   return;
    // }
    // languages = await LanguesRepository().fetchLanguages();
    // update();
  }

  //region [ Is A ListView MenuChant ]
  bool getIsAListView() {
    _isList= sharedPref.getBool("IsAListView") ?? true;
    update();
    return _isList;
  }

  setIsAListView(bool value) {
    _isList = value;
    sharedPref.setBool("IsAListView", value);
  }
  //endregion

  //region [ setFormatListOrGrid ]
  bool _isList = false;
  bool get isList => _isList;

  IconData _iconListOrGrid = Icons.grid_on;
  IconData get iconListOrGrid => _iconListOrGrid;
  String _labelFormatListOrGrid = 'label_format_grid'.tr;
  String get labelFormatListOrGrid => _labelFormatListOrGrid;

  getFormatListOrGrid() {
    _isList = getIsAListView();
    if (_isList) {
      _iconListOrGrid = Icons.grid_on;
      _labelFormatListOrGrid = 'label_format_grid'.tr;
    } else {
      _iconListOrGrid = Icons.view_list;
      _labelFormatListOrGrid = 'label_format_list'.tr;
    }
    update();
  }

  void setFormatListOrGrid() {
    _isList = !_isList;
    _iconListOrGrid = (_iconListOrGrid == Icons.grid_on) ? Icons.view_list : Icons.grid_on;
    _labelFormatListOrGrid = (_isList) ? 'label_format_grid'.tr : 'label_format_list'.tr;
    setIsAListView(_isList);
    update();
  }

//endregion
  //region [ checkForUpdate ]
  bool flexibleUpdateAvailable1 = true;
  bool get flexibleUpdateAvailable => flexibleUpdateAvailable1;
  DeviceAppVersionModel deviceAppVersion = DeviceAppVersionModel();
  Future checkUpdateOnServer() async {
    try {
      String versionNameAndBuildNumber = '${_packageInfo.version}.${_packageInfo.buildNumber}';
      deviceAppVersion = await deviceAppVersionRepository.getDeviceAppVersionByPackageName();
      logCat('Online:${deviceAppVersion.versionNameAndBuildNumber} -> Device: $versionNameAndBuildNumber');
      if (deviceAppVersion.buildNumber > 0) {
        deviceAppVersion.currentVersionNameAndBuildNumber = versionNameAndBuildNumber;
        if (deviceAppVersion.buildNumber > TypeSafeConversion.nullSafeInt(_packageInfo.buildNumber)) {
          return onLoadDialogReminderUpdate(deviceAppVersion: deviceAppVersion);
        }
      }
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'checkUpdateOnServer');
    }
  }

  Future checkOrUpdateApp() async {
    try {
      if (CheckPlatform().isAndroid) {
        AppUpdateInfo? updateInfo = await InAppUpdate.checkForUpdate();
        //if( updateInfo==null ) {
          if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
            await InAppUpdate.startFlexibleUpdate();
            return;
          }
        //}
      }
      await checkUpdateOnServer();
      return;
    } on PlatformException catch (ex, trace) {
      if (ex.code == "TASK_FAILURE" && ex.message?.contains("Install Error(-6)") == true) {

      }
      logError(ex, trace: trace, position: 'PlatformException::checkOrUpdateAndroid');
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'checkOrUpdateAndroid');
    }
    await checkUpdateOnServer();
  }

//endregion

//region [  ]
  /*openAppLSB() async {
    try {
      if (!checkPlatform.isMobile) {
        await MyLauncher.launchInBrowser(Constant.urlWebSiteLaBible);
      } else {
        await MyLauncher.openAppLSB();
      }
    } catch (ex) {
      await MyLauncher.launchInBrowser(Constant.urlAppleOrGoogleStoreLSB());
      // if (checkPlatform.isAndroid) {
      // }
      // if (checkPlatform.isIOS) {
      //   MyLauncher.launchInBrowser(Constant.urlAppleStoreLSB);
      // }
      logError(ex);
    }
  }*/
// endregion

  //region [  ]
  /*openAppCCG() async {
    try {
      if (!CheckPlatform().isMobile) {
        await MyLauncher.launchInBrowser( Constant.urlWebSiteChantCCG);
        //await MyLauncher.launchInBrowser(Constant.urlWebSiteCCG);
      }else if (CheckPlatform().isIOS) {
        await MyLauncher.launchInBrowser( Constant.urlWebSiteChantCCG);
      }else {
        await MyLauncher.openAppCCG();
      }
    } catch (ex) {
      await MyLauncher.launchInBrowser( Constant.urlWebSiteChantCCG);
      //await MyLauncher.launchInBrowser(Constant.urlAppleOrGoogleStoreCCG());
      logError(ex);
    }
  }*/
// endregion
}
