import 'package:brain_dev_tools/tools/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalPreference {
  //region [ ATTRIBUTE 1 ]
  static SharedPreferences? sharedPref;
  static final Future<SharedPreferences> _sharedPreferences =
  SharedPreferences.getInstance();

  //endregion

  //region [ TextSize ]
  Future<double> getTextSize() async {
    sharedPref = await _sharedPreferences;
    double textSize = sharedPref?.getDouble("TextSize") ?? 18.0;
    return textSize;
  }

  setTextSize(double value) async {
    sharedPref = await _sharedPreferences;
    sharedPref?.setDouble("TextSize", value);
  }

  Future<double> getTextSizeFullScreen() async {
    sharedPref = await _sharedPreferences;
    double textSizeFullScreen =
        sharedPref?.getDouble("TextSizeFullScreen") ?? 50;
    return textSizeFullScreen;
  }

  setTextSizeFullScreen(double value) async {
    sharedPref = await _sharedPreferences;
    sharedPref?.setDouble("TextSizeFullScreen", value);
  }

  //endregion

  //region [ current Position ]
  Future<int> getCurrentPosition() async {
    sharedPref = await _sharedPreferences;
    int currentPosition = sharedPref?.getInt("CurrentPosition") ?? 0;
    return currentPosition;
  }

  setCurrentPosition(int value) async {
    sharedPref = await _sharedPreferences;
    sharedPref?.setInt("CurrentPosition", value);
  }

  //endregion

  //region [ Alignment ]
  Future<String> getAlignText() async {
    sharedPref = await _sharedPreferences;
    return sharedPref?.getString("AlignmentPosition") ?? Constant.alignCenter;
  }

  setAlignText(String value) async {
    sharedPref = await _sharedPreferences;
    sharedPref?.setString("AlignmentPosition", value);
  }

//endregion

  //region [ Is First Load ]
  Future<bool> getIsFirstLoad() async {
    sharedPref = await _sharedPreferences;
    return sharedPref?.getBool("IsFirstLoad") ?? true;
  }

  setIsFirstLoad(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref?.setBool("IsFirstLoad", value);
  }

  //endregion

  //region [ Is Language Systeme ]
  Future<bool> getIsLanguageSysteme() async {
    sharedPref = await _sharedPreferences;
    return sharedPref?.getBool("IsLanguageSysteme") ?? true;
  }

  setIsLanguageSysteme(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref?.setBool("IsLanguageSysteme", value);
  }

  //endregion

  //region [ Is DarkMode Systeme ]
  Future<bool> getIsDarkModeSysteme() async {
    sharedPref = await _sharedPreferences;
    return sharedPref?.getBool("IsDarkModeSysteme") ?? true;
  }

  setIsDarkModeSysteme(bool value) async {
    sharedPref = await _sharedPreferences;
    sharedPref?.setBool("IsDarkModeSysteme", value);
  }
//endregion

}

GlobalPreference globalPreference = GlobalPreference();
