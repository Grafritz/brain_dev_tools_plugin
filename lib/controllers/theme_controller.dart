import 'package:brain_dev_tools/config/app_config.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:brain_dev_tools/tools/utils/image_icon_resources.dart';
import 'package:brain_dev_tools/views/color_theme_dialog.dart';
import 'package:brain_dev_tools/tools/constant.dart';
import 'package:brain_dev_tools/tools/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final SharedPreferences sharedPreferences;

  ThemeController({
    required this.sharedPreferences,
  }) {
    _loadSetting();
  }

  //region [  ]
  _loadSetting() {
    getIsBrightnessDark();
    getPrimaryColorSwatch();
    getAllowsNotifications();
    getSpaceBetweenVerses();
    getLetterSpacing();
    getFontSize();
    getAlignText();
    getWordSpacing();

    getIsSplitEnable();
    getPdlClick();
    getQuizClick();
  }

  //endregion


  //region [ IsSplitEnable ]
  bool _isSplitEnable = false;
  bool get isSplitEnable => _isSplitEnable;
  getIsSplitEnable() {
    _isSplitEnable= sharedPreferences.getBool("getIsSplitEnable") ?? false;
    update();
  }
  setIsSplitEnable(bool value) {
    _isSplitEnable=value;
    sharedPreferences.setBool("getIsSplitEnable", value);
    update();
  }
  toggleSplitEnable() {
    _isSplitEnable=!_isSplitEnable;
    sharedPreferences.setBool("getIsSplitEnable", _isSplitEnable);
    update();
  }
  //endregion

  //region [ Constant.pdlClick ]
  int _pdlClick = 0;
  int get pdlClick => _pdlClick;
  getPdlClick()  {
    _pdlClick= sharedPreferences.getInt(Constant.pdlClick) ?? 0;
    update();
  }
  setPdlClick(int value)  {
    _pdlClick+=1;
    sharedPreferences.setInt(Constant.pdlClick, _pdlClick);
    update();
  }
  //endregion

  //region [ Constant.quizClick ]
  int _quizClick = 0;
  int get quizClick => _quizClick;
  getQuizClick()  {
    _quizClick= sharedPreferences.getInt(Constant.quizClick) ?? 0;
    update();
  }
  setQuizClick()  {
    _quizClick+=1;
    sharedPreferences.setInt(Constant.quizClick, _quizClick);
    update();
  }
  //endregion

  //region MaterialColor colorTheme
  MaterialColor? get colorTheme => !Get.isDarkMode ? _colorTheme : null;
  MaterialColor _colorTheme = Colors.deepOrange;

  set colorThemeData(MaterialColor color) {
    _colorTheme = color;
    update();
  }

  //endregion

  //region [ IsShowCaseHomeEnable ]
  bool get isShowCaseHome2Time {
    return sharedPreferences.getBool("isShowCaseHome2Time1") ?? false;
  }
  set isShowCaseHome2Time(bool value) {
    sharedPreferences.setBool("isShowCaseHome2Time1", value);
  }

  bool get isShowCaseHomeEnable {
    return sharedPreferences.getBool("getIsShowCaseHomeEnable1") ?? true;
  }

  set isShowCaseHomeEnable(bool value) {
    sharedPreferences.setBool("getIsShowCaseHomeEnable1", value);
  }

  bool get isShowCaseCViewDetailEnable {
    return sharedPreferences.getBool("is.ShowCaseCViewDetailEnable") ?? true;
  }

  set isShowCaseCViewDetailEnable(bool value) {
    sharedPreferences.setBool("is.ShowCaseCViewDetailEnable", value);
  }
  //endregion

  //region [ notification ]
  bool _allowsNotifications = true;

  bool get allowsNotifications => _allowsNotifications;

  getAllowsNotifications() {
    _allowsNotifications = sharedPreferences.getBool("notification") ?? true;
    update();
  }

  setAllowsNotifications(bool value) {
    _allowsNotifications = value;
    sharedPreferences.setBool("notification", value);
    update();
  }

  //endregion

  //region [ Brightness ]
  bool _isBrightnessDark = false;

  bool get isBrightnessDark => _isBrightnessDark;

  Brightness get brightness =>
      _isBrightnessDark ? Brightness.dark : Brightness.light;

  String get labelTheme => _isBrightnessDark//Get.isDarkMode
      ? 'label_Desactiver_mode_sombre'.tr
      : 'label_activer_mode_sombre'.tr;

  void toggleTheme() {
    //var theme = Get.isDarkMode? ThemeData.light(): ThemeData.dark();
    //Get.changeTheme(theme);
    _isBrightnessDark = !_isBrightnessDark;
    sharedPreferences.setBool('isDark', _isBrightnessDark);
    update();
  }

  getIsBrightnessDark() {
    _isBrightnessDark = sharedPreferences.getBool("isDark") ?? false;
    update();
  }

  //endregion

  //region MaterialColor colorTheme
  MaterialColor colorTheme2 = MyColors.primaryColor[1]; //Colors.deepOrange;
  MaterialColor get colorTheme1 => _colorTheme;

  getPrimaryColorSwatch() {
    int color = sharedPreferences.getInt("primaryColorSwatch") ?? 1;
    _colorTheme = MyColors.primaryColor[color];
    update();
  }

  setColorTheme(int value) {
    sharedPreferences.setInt("primaryColorSwatch", value);
    _colorTheme = MyColors.primaryColor[value];
    update();
  }

  //endregion

  //region [ Reading Settings ]
  //region [ spaceBetweenVerses ]
  double _spaceBetweenVerses = 3;

  double get spaceBetweenVerses => _spaceBetweenVerses;

  getSpaceBetweenVerses() {
    _spaceBetweenVerses =
        sharedPreferences.getDouble("SpaceBetweenVerses") ?? 3;
    update();
  }

  setSpaceBetweenVerses(double value) {
    _spaceBetweenVerses = value;
    sharedPreferences.setDouble("SpaceBetweenVerses", value);
    update();
  }

  //endregion

  //region [ letterSpacing ]
  double _letterSpacing = 0;

  double get letterSpacing => _letterSpacing;

  getLetterSpacing() {
    _letterSpacing = sharedPreferences.getDouble("getLetterSpacing") ?? 0;
    update();
  }

  setLetterSpacing(double value) {
    _letterSpacing = value;
    sharedPreferences.setDouble("getLetterSpacing", value);
    update();
  }

  //endregion

  //region [ _fontSize ]
  double _fontSize = 18;

  double get fontSize => _fontSize;

  getFontSize() {
    _fontSize = sharedPreferences.getDouble("getFontSize") ?? 18;
    update();
  }

  setFontSize(double value) {
    _fontSize = value;
    sharedPreferences.setDouble("getFontSize", value);
    update();
  }

  //endregion

  //region [ alignText ]
  String _alignText = Constant.alignCenter;

  String get alignText => _alignText;

  getAlignText() {
    _alignText =
        sharedPreferences.getString("getAlignText") ?? Constant.alignCenter;
    update();
  }

  setAlignText(String value) {
    _alignText = value;
    sharedPreferences.setString("getAlignText", value);
    update();
  }

  //endregion

  //region [ _wordSpacing ]
  double _wordSpacing = 0;

  double get wordSpacing => _wordSpacing;

  getWordSpacing() {
    _wordSpacing = sharedPreferences.getDouble("getWordSpacing") ?? 0;
    update();
  }

  setWordSpacing(double value) {
    _wordSpacing = value;
    sharedPreferences.setDouble("getWordSpacing", value);
    update();
  }

  //endregion
  //endregion
  showColorThemeDialog() {
    showDialog(
        context: Get.context!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const ColorThemeDialog();
        }); //.then((value) => Get.find<AdmobController>().showInterstitialAd());
  }

  showModalBottomParametresSystems() {
    /*showModalBottomSheet(
      context: Get.context!,
      builder: (sheetContext) =>
          BottomSheet(
            builder: (_) => ParametresSystems(),
            onClosing: () {},
          ),
    );*/
  }

  // showModalParametreDeLecture() {
  //   return showModalBottomSheet(
  //     context: Get.context!,
  //     builder: (sheetContext) => BottomSheet(
  //       builder: (_) => const ParametresDeLecture(isShowTitle: true),
  //       onClosing: () {},
  //     ),
  //   ).then((value) => Get.find<AdmobController>().loadAndShowInterstitialAd());
  // }

  String get imgBg {
    switch (EnvironmentVariable.environmentType) {
      case EnumEnvironmentType.chantchoraleetgroupe:
        if( isBrightnessDark){
          return ImageIconResources.bg_ccg_dark;
        }
        return ImageIconResources.bg_ccg_light;

      case EnumEnvironmentType.chantdesperance:
      case EnumEnvironmentType.chantdesperancelegacy:
        if( isBrightnessDark){
          return ImageIconResources.bg_chant_desperance_dark;
        }
        return ImageIconResources.bg_chant_desperance_light;

      case EnumEnvironmentType.lyricevangelique:
        if( isBrightnessDark){
          return ImageIconResources.bg_chant_desperance_dark;
        }
        return ImageIconResources.bg_chant_desperance_light;

      case EnumEnvironmentType.chantlyric:
        if( isBrightnessDark){
          return ImageIconResources.bg_chant_desperance_dark;
        }
        return ImageIconResources.bg_chant_lyric_light;
      default:
    }
    return ImageIconResources.bg_ccg_light;
  }
}
