
import 'package:brain_dev_tools/models/la_bible/quiz/base/difficulty_model.dart';
import 'package:brain_dev_tools/tools/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  SharedPreferences sharedPref;
  MySharedPref({ required this.sharedPref  });

  //region [ Is OnlineModeActivate ]
  Future<bool> getIsOnlineModeActivate() async {
    return sharedPref.getBool("IsOnlineModeActivate") ?? true;
  }
  Future<bool> setIsOnlineModeActivate(bool value) async {
    sharedPref.setBool("IsOnlineModeActivate", value);
    return value;
  }
  //endregion

  //region [ Is A ListView ]
  Future<bool> getIsAListView() async {
    return sharedPref.getBool("IsAListView") ?? true;
  }
  Future<bool> setIsAListView(bool value) async {
    sharedPref.setBool("IsAListView", value);
    return value;
  }
  Future<bool> getIsAListViewPdl() async {
    return sharedPref.getBool("IsAListViewPdl") ?? true;
  }
  Future<bool> setIsAListViewPdl(bool value) async {
    sharedPref.setBool("IsAListViewPdl", value);
    return value;
  }
  //endregion

  //region [ User ]
  /*Future<UserModel> getUsers() async {
    String value = sharedPref.getString("UsersModel") ?? "";
    if(value!='') {
      return UserModel.fromJson(json.decode(value));
    }
    return UserModel(id: 0, connecterYN: false);
  }
  setUsers(UserModel users) async {
    var jsonVal = json.encode(users.toJson());
    // logCat('UsersModel:$jsonVal');
    sharedPref.setString("UsersModel", jsonVal);
  }*/
  //endregion


  //region [ Recompense Ads ]
  Future<int> getRecompenseAds() async {
    return sharedPref.getInt("RecompenseAds") ?? 20;
  }
  setRecompenseAds(int value) async {
    sharedPref.setInt("RecompenseAds", value);
  }
  Future<int> getRecompenseAdsQR() async {
    return sharedPref.getInt("RecompenseAdsQR") ?? 20;
  }
  setRecompenseAdsQR(int value) async {
    sharedPref.setInt("RecompenseAdsQR", value);
  }
  //endregion


  //region [ Bible Version ]
  Future<bool> getIsVersionBibleDownload({ required String fileName }) async {
    return sharedPref.getBool("getIs${fileName.split('.').first.toUpperCase()}Download") ?? false;
  }
  setIsVersionBibleDownload(bool value, { required String fileName}) async {
    sharedPref.setBool("getIs${fileName.split('.').first.toUpperCase()}Download", value);
  }

  Future<bool> getReminderDownloadVersionBible() async {
    return sharedPref.getBool("ReminderDownloadVersionBible") ?? true;
  }
  setReminderDownloadVersionBible(bool value) async {
    sharedPref.setBool("ReminderDownloadVersionBible", value);
  }

  Future<bool> getIsNewVersionBibleDownload({ required String fileName }) async {
    return sharedPref.getBool("12getIsNew${fileName.split('.').first.toUpperCase()}Download") ?? false;
  }
  setIsNewVersionBibleDownload(bool value, { required String fileName}) async {
    sharedPref.setBool("12getIsNew${fileName.split('.').first.toUpperCase()}Download", value);
  }
  Future<bool> getReminderDownloadNewVersionBible() async {
    return sharedPref.getBool("12ReminderDownloadNewVersionBible") ?? true;
  }
  setReminderDownloadNewVersionBible(bool value) async {
    sharedPref.setBool("12ReminderDownloadNewVersionBible", value);
  }
  //endregion

  //region [ TextSize ]
  Future<double> getTextSize() async {
    double textSize = sharedPref.getDouble("TextSize") ?? 18;
    return textSize;
  }
  setTextSize(double value) async {
    sharedPref.setDouble("TextSize", value);
  }

  Future<double> getTextSizeFullScreen() async {
    double textSizeFullScreen =
        sharedPref.getDouble("TextSizeFullScreen") ?? 50;
    return textSizeFullScreen;
  }
  setTextSizeFullScreen(double value) async {
    sharedPref.setDouble("TextSizeFullScreen", value);
  }
  //endregion

  //region [ CurrentPosition ]
  Future<int> getCurrentPosition() async {
    int currentPosition = sharedPref.getInt("CurrentPosition") ?? 0;
    return currentPosition;
  }
  setCurrentPosition(int value) async {
    sharedPref.setInt("CurrentPosition", value);
  }
  //endregion

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
  Future<String> getDbNameBible() async {
    var data = sharedPref.getString("DbNameBible") ?? Constant.defaultDbNameBible;
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



  Future<double> getPaddingBottomSheet() async {
    return sharedPref.getDouble("PaddingBottomSheet") ?? 0;
  }
  setPaddingBottomSheet(double value) async {
    sharedPref.setDouble("PaddingBottomSheet", value);
  }

  //region [ Reading Settings ]
  // Future<String> getPreferredLanguage() async {
  //   return await globalTranslations.getPreferredLanguage() ?? Constant.langueFRANCAISE;
  // }
  //endregion

  //region [ Notification PLan ]
  getTimeReminderReadPlan() async {
    return sharedPref.getString("TimeReminderReadPlan") ?? '08:00 AM';
  }
  setTimeReminderReadPlan(String value) async {
    sharedPref.setString("TimeReminderReadPlan", value);
  }

  getIsReminderToReadPlan() {
    return sharedPref.getBool("IsReminderToReadPlan") ?? true;
  }
  setIsReminderToReadPlan(bool value) async {
    sharedPref.setBool("IsReminderToReadPlan", value);
  }
  //endregion

  //region [ Quiz ]
  getIsShowBottomSheetQuiz() async {
    return sharedPref.getBool("IsShowBottomSheetQuiz") ?? true;
  }
  setIsShowBottomSheetQuiz(bool value) async {
    sharedPref.setBool("IsShowBottomSheetQuiz", value);
  }

  getNbrOfQuestionsQuiz() async {
    return sharedPref.getInt("NbrOfQuestionsQuiz") ?? 10;
  }
  setNbrOfQuestionsQuiz(int value) async {
    sharedPref.setInt("NbrOfQuestionsQuiz", value);
  }

  getDifficultyQuiz() async {
    return sharedPref.getString("DifficultyQuiz") ?? DifficultyModel.Easy;
  }
  setDifficultyQuiz(String value) async {
    sharedPref.setString("DifficultyQuiz", value);
  }
  //endregion


  //region [ idAutoIncrement ]
  Future<int> idAutoIncrement( { required String tableNameKey } ) async {
    int id = await getIdAutoIncrement( tableNameKey: tableNameKey )+1;
    setIdAutoIncrement(id, tableNameKey: tableNameKey );
    return id;
  }
  Future<int> getIdAutoIncrement( { required String tableNameKey } ) async {
    return sharedPref.getInt("IdAuto$tableNameKey") ?? 0;
  }
  setIdAutoIncrement(int value, { required String tableNameKey } ) async {
    sharedPref.setInt("IdAuto$tableNameKey", value);
  }
//endregion
}

class MySharedPreferences
{
  //region [ ATTRIBUTE 1 ]
  static final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();
  static SharedPreferences sharedPref = _sharedPreferences as SharedPreferences;
  //endregion

  // Resets all settings to default./

  //region [ Is A ListView ]
  Future<bool> getIsAListView() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("IsAListView") ?? true;
  }
  Future<bool> setIsAListView(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("IsAListView", value);
    return value;
  }
  Future<bool> getIsAListViewPdl() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("IsAListViewPdl") ?? true;
  }
  Future<bool> setIsAListViewPdl(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("IsAListViewPdl", value);
    return value;
  }
  //endregion


  //region [ Recompense Ads ]
  Future<int> getRecompenseAds() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getInt("RecompenseAds") ?? 20;
  }
  setRecompenseAds(int value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setInt("RecompenseAds", value);
  }
  Future<int> getRecompenseAdsQR() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getInt("RecompenseAdsQR") ?? 20;
  }
  setRecompenseAdsQR(int value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setInt("RecompenseAdsQR", value);
  }
  //endregion


  //region [ Bible Version ]
  Future<bool> getIsVersionBibleDownload({ required String fileName }) async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("getIs${fileName.split('.').first.toUpperCase()}Download") ?? false;
  }
  setIsVersionBibleDownload(bool value, { required String fileName}) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("getIs${fileName.split('.').first.toUpperCase()}Download", value);
  }

  Future<bool> getReminderDownloadVersionBible() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("ReminderDownloadVersionBible") ?? true;
  }
  setReminderDownloadVersionBible(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("ReminderDownloadVersionBible", value);
  }

  Future<bool> getIsNewVersionBibleDownload({ required String fileName }) async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("12getIsNew${fileName.split('.').first.toUpperCase()}Download") ?? false;
  }
  setIsNewVersionBibleDownload(bool value, { required String fileName}) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("12getIsNew${fileName.split('.').first.toUpperCase()}Download", value);
  }
  Future<bool> getReminderDownloadNewVersionBible() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("12ReminderDownloadNewVersionBible") ?? true;
  }
  setReminderDownloadNewVersionBible(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("12ReminderDownloadNewVersionBible", value);
  }
  //endregion

  //region [ TextSize ]
  Future<double> getTextSize() async {
    sharedPref = await _sharedPreferences;
    double textSize = sharedPref.getDouble("TextSize") ?? 18;
    return textSize;
  }
  setTextSize(double value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setDouble("TextSize", value);
  }

  Future<double> getTextSizeFullScreen() async {
    sharedPref = await _sharedPreferences;
    double textSizeFullScreen =
        sharedPref.getDouble("TextSizeFullScreen") ?? 50;
    return textSizeFullScreen;
  }
  setTextSizeFullScreen(double value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setDouble("TextSizeFullScreen", value);
  }
  //endregion

  //region [ CurrentPosition ]
  Future<int> getCurrentPosition() async {
    sharedPref = await _sharedPreferences;
    int currentPosition = sharedPref.getInt("CurrentPosition") ?? 0;
    return currentPosition;
  }
  setCurrentPosition(int value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setInt("CurrentPosition", value);
  }
  //endregion

  //region [ IsSplitEnable ]
  // Future<bool> getIsSplitEnable() async {
  //   sharedPref = await _sharedPreferences;
  //   return sharedPref.getBool("getIsSplitEnable") ?? false;
  // }
  // setIsSplitEnable(bool value) async {
  //   sharedPref = await _sharedPreferences;
  //   sharedPref.setBool("getIsSplitEnable", value);
  // }
  //endregion

  //region [ notification ]
  // Future<bool> getNotification() async {
  //   sharedPref = await _sharedPreferences;
  //   return sharedPref.getBool("notification") ?? true;
  // }
  // setNotification(bool value) async {
  //   sharedPref = await _sharedPreferences;
  //   sharedPref.setBool("notification", value);
  // }
  // Future<bool> getAllowsNotifications() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool("notification") ?? true;
  // }
  // Future<bool> setAllowsNotifications(bool value) async {
  //   final SharedPreferences prefs = await _sharedPreferences;
  //   return prefs.setBool("notification", value);
  // }
  //endregion

  //region [ Db Bible ]
  Future<bool> getIsDbBibleChange() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("getIsDbBibleChange") ?? false;
  }
  setIsDbBibleChange(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("getIsDbBibleChange", value);
  }
  Future<bool> getIsDbBibleChange2() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("getIsDbBibleChange2") ?? false;
  }
  setIsDbBibleChange2(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("getIsDbBibleChange2", value);
  }
  Future<bool> getIsFirstDbBibleCopy() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("getIsFirstDbBibleCopy") ?? false;
  }
  setIsFirstDbBibleCopy(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("getIsFirstDbBibleCopy", value);
  }
  Future<bool> getIsNewFirstDbBibleCopy() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("getIsNewFirstDbBibleCopy12") ?? false;
  }
  setIsNewFirstDbBibleCopy(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("getIsNewFirstDbBibleCopy12", value);
  }
  Future<String> getDbNameBible() async {
    sharedPref = await _sharedPreferences;
    var data = sharedPref.getString("DbNameBible") ?? Constant.defaultDbNameBible;
    return data;
  }
  Future<String> getDbNameBibleWithOutExtension() async {
    var data = await getDbNameBible();
    return data.replaceAll('.db', '');
  }
  setDbNameBible(String value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setString("DbNameBible", value);
  }
  Future<String> getDbNameBible2() async {
    sharedPref = await _sharedPreferences;
    var data = sharedPref.getString("DbNameBible2") ?? Constant.defaultDbNameBible;
    return data;
  }
  setDbNameBible2(String value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setString("DbNameBible2", value);
  }
  //endregion



  Future<double> getPaddingBottomSheet() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getDouble("PaddingBottomSheet") ?? 0;
  }
  setPaddingBottomSheet(double value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setDouble("PaddingBottomSheet", value);
  }

  //region [ Reading Settings ]
  // Future<String> getPreferredLanguage() async {
  //   return await globalTranslations.getPreferredLanguage() ?? Constant.langueFRANCAISE;
  // }
  //endregion

  //region [ Notification PLan ]
  Future<String> getTimeReminderReadPlan() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getString("TimeReminderReadPlan") ?? '08:00 AM';
  }
  setTimeReminderReadPlan(String value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setString("TimeReminderReadPlan", value);
  }

  Future<bool> getIsReminderToReadPlan() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("IsReminderToReadPlan") ?? true;
  }
  setIsReminderToReadPlan(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("IsReminderToReadPlan", value);
  }
  //endregion

  //region [ Quiz ]
  Future<bool> getIsShowBottomSheetQuiz() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getBool("IsShowBottomSheetQuiz") ?? true;
  }
  setIsShowBottomSheetQuiz(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setBool("IsShowBottomSheetQuiz", value);
  }

  Future<int> getNbrOfQuestionsQuiz() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getInt("NbrOfQuestionsQuiz") ?? 10;
  }
  setNbrOfQuestionsQuiz(int value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setInt("NbrOfQuestionsQuiz", value);
  }

  Future<String> getDifficultyQuiz() async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getString("DifficultyQuiz") ?? DifficultyModel.Easy;
  }
  setDifficultyQuiz(String value) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setString("DifficultyQuiz", value);
  }
  //endregion


  //region [ idAutoIncrement ]
  Future<int> idAutoIncrement( { required String tableNameKey } ) async {
    int id = await getIdAutoIncrement( tableNameKey: tableNameKey )+1;
    setIdAutoIncrement(id, tableNameKey: tableNameKey );
    return id;
  }
  Future<int> getIdAutoIncrement( { required String tableNameKey } ) async {
    sharedPref = await _sharedPreferences;
    return sharedPref.getInt("IdAuto$tableNameKey") ?? 0;
  }
  setIdAutoIncrement(int value, { required String tableNameKey } ) async {
    sharedPref = await _sharedPreferences;
    sharedPref.setInt("IdAuto$tableNameKey", value);
  }
  //endregion
}
MySharedPreferences globalSessionPref = MySharedPreferences();
MySharedPreferences mySharedPreferences = MySharedPreferences();
