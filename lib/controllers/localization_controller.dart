import 'dart:ui';

import 'package:brain_dev_tools/I10n/l10n.dart';
import 'package:brain_dev_tools/config/app_config.dart';
import 'package:brain_dev_tools/views/language_dialog.dart';
import 'package:brain_dev_tools/models/language_model.dart';
import 'package:brain_dev_tools/tools/constant.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationController extends GetxController {
  final SharedPreferences sharedPreferences;

  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }

  Locale _locale =
      Locale(L10n.langFrancais.languageCode, L10n.langFrancais.countryCode);
  bool _isLtr = true;
  List<LanguageModel> _languages = [];

  Locale get locale => _locale;

  bool get isLtr => _isLtr;

  List<LanguageModel> get languages => _languages;

  void setLanguageStr(String data)
  {
    var localData = Locale(data, data);
    setLanguage(localData);
  }
  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    if (_locale.languageCode == 'ar') {
      _isLtr = false;
    } else {
      _isLtr = true;
    }
    saveLanguage(_locale);
    update();
  }

  /*getPreferredLanguage() async {
    try {
      bool isFirstLoad = await globalPreference.getIsFirstLoad();
      if (isFirstLoad) {
        await getIsLanguageSysteme(isFirstLoad: isFirstLoad);
        globalPreference.setIsFirstLoad(false);
      }
      if (!isFirstLoad) {
        await getIsLanguageSysteme(isFirstLoad: isFirstLoad);
      }
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'initState');
    }
  }*/

  /*getIsLanguageSysteme({required bool isFirstLoad}) async {
    try {
      //logCat('getIsLanguageSysteme: isFirstLoad:: $isFirstLoad');
      bool isLanguageSysteme = await globalPreference.getIsLanguageSysteme();
      //logCat('getIsLanguageSysteme: isLanguageSysteme:: $isLanguageSysteme');
      if (isLanguageSysteme) {
        Locale deviceLocale = window.locale;
        //logCat('getIsLanguageSysteme: deviceLocale.languageCode:: ${deviceLocale.languageCode}');
        if (L10n.languagesStr.contains(deviceLocale.languageCode)) {
          setLanguage(deviceLocale);
          //logCat('getIsLanguageSysteme: SET LanguageSysteme:: ${deviceLocale.languageCode}');
        }

        if (isFirstLoad) {
          //logCat('getIsLanguageSysteme: SET isFirstLoad:: $isLanguageSysteme');
          setLanguage(L10n.langueFrancais);
        }
      }
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'initState');
    }
  }*/

  void loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences.getString(Constant.LANGUAGE_CODE) ?? L10n.langFrancais.languageCode,
        sharedPreferences.getString(Constant.COUNTRY_CODE) ?? L10n.langFrancais.countryCode);
    _isLtr = _locale.languageCode != 'ar';
    var langues = EnvironmentVariable.appLanguages;
    if( langues.isEmpty ){
      langues = L10n.languages_en_fr_es_ht;
    }
    _selectedIndex = langues.indexWhere((x)=> x.languageCode == _locale.languageCode);
    _languages = [];
    _languages.addAll(langues);

    update();
  }

  void saveLanguage(Locale locale) async {
    //globalTranslations.setNewLanguage(newLanguage: locale.languageCode);
    sharedPreferences.setString(Constant.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(Constant.COUNTRY_CODE,
        TypeSafeConversion.nullSafeString(locale.countryCode));
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void searchLanguage(String query) {
    var langues = EnvironmentVariable.appLanguages;
    if( langues.isEmpty ){
      langues = L10n.languages_en_fr_es_ht;
    }
    if (query.isEmpty) {
      _languages = [];
      _languages = langues;
    } else {
      _selectedIndex = -1;
      _languages = [];
      for (var language in langues) {
        if (language.languageName.toLowerCase().contains(query.toLowerCase())) {
          _languages.add(language);
        }
      }
    }
    update();
  }

  showLanguesChoice() {
    showDialog(
        context: Get.context!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return LanguageDialog();
        });
  }
}
