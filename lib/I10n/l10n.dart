// ignore_for_file: constant_identifier_names
// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
import 'package:brain_dev_tools/models/language_model.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:brain_dev_tools/tools/utils/image_icon_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class L10n {
  static final storageKey = "MyCCGApplication_";
  static final storageKeyLanguage = "language";

  static String codeFrancais = 'fr'; //
  static String codeAnglais = 'en';
  static String codeCreole = 'ht';
  static String codeEspagnole = 'es';
  static String codeArabic = 'ar';

  static final langueFrancais = Locale(codeFrancais, 'FR');
  static final langueCreole = Locale(codeCreole, 'HT');
  static final langueAnglais = Locale(codeAnglais, 'US');
  static final langueEspagnole = Locale(codeEspagnole, 'ES');
  static final langueArabic = Locale(codeArabic, 'SA');

  static final langFrancais = LanguageModel(
      imageUrl: ImageIconResources.flagFrancais,
      languageName: 'label_LangueFrancaise'.tr,
      countryCode: 'FR',
      languageCode: 'fr',
      emoji: '🇫🇷');
  static final langCreole = LanguageModel(
      imageUrl: ImageIconResources.flagCreole,
      languageName: 'label_LangueCreole'.tr,
      countryCode: 'HT',
      languageCode: 'ht',
      emoji: '🇭🇹');
  static final langAnglais = LanguageModel(
      imageUrl: ImageIconResources.flagEnglish,
      languageName: 'label_LangueAnglaise'.tr,
      countryCode: 'US',
      languageCode: 'en',
      emoji: '🇺🇸');
  static final langEspagnole = LanguageModel(
      imageUrl: ImageIconResources.flagEspagnole,
      languageName: 'label_LangueEspagnole'.tr,
      countryCode: 'ES',
      languageCode: 'es',
      emoji: '🇪🇸');
  static final langArabic = LanguageModel(
      imageUrl: ImageIconResources.flagSaudi,
      languageName: 'Arabic'.tr,
      countryCode: 'SA',
      languageCode: 'ar',
      emoji: '🇦🇪');

  static final languages1 = [
    langueFrancais,
    langueCreole,
    langueAnglais,
    langueEspagnole,
  ];
  static List<LanguageModel> languages_en_fr_es_ht = [
    langAnglais,
    langFrancais,
    langEspagnole,
    langCreole,
  ];

  static final languagesLocal = [
    langueFrancais,
    langueCreole,
    langueAnglais,
    langueEspagnole,
  ];

  static final languagesStr = [
    codeFrancais,
    codeAnglais,
    codeEspagnole,
    codeCreole,
  ];

  static Locale getLanguage(deviceLocale, supportedLocales) {
    for( var locale in supportedLocales ){
      if( locale.languageCode == deviceLocale!.languageCode ){
        return deviceLocale;
      }
    }
    return supportedLocales.first;
  }

  static String getFlag(String code) {
    // https://emojipedia.org/fr/drapeau-étatsunis/

    switch (code) {
      case 'fr':
        return '🇫🇷';
      case 'es':
        return '🇪🇸';
      case 'ht':
        return '🇭🇹';
      case '🇺🇸':
      default:
        return '🇺🇸';
    }
  }

  static getLangueStr({ required Langue langue }){
    switch(langue) {
      case Langue.creole:
        return L10n.codeCreole;
      case Langue.francais:
        return L10n.codeFrancais;
      case Langue.anglais:
        return codeAnglais;
      case Langue.espagnole:
        return codeEspagnole;
      default:
        return L10n.codeFrancais;
    }
  }
}