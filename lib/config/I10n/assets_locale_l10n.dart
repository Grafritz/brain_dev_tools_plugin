// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:brain_dev_tools/I10n/l10n.dart';
import 'package:brain_dev_tools/config/app_config.dart';
import 'package:brain_dev_tools/models/language_model.dart';
import 'package:flutter/services.dart';

class AssetsLocaleL10n
{
  static const String packagesNameBrain_dev_tools = 'packages/brain_dev_tools';
  static appTranslator() async
  {
    var langues = EnvironmentVariable.appLanguages;
    String assetsPathLanguage = EnvironmentVariable.assetsPathLanguage;
    if( langues.isEmpty ){
      langues = L10n.languages_en_fr_es_ht;
    }
    //region  Retrieving localized data
    Map<String, Map<String, String>> languages = {};
    if(assetsPathLanguage.isEmpty) { // S'il n'existe pas de fichier de langue
      for(LanguageModel languageModel in langues) { // Take the package file only
        String filePath0Tool = '$packagesNameBrain_dev_tools/assets/locale/i18n_${languageModel.languageCode}.json';
        String jsonStringValues =  await rootBundle.loadString(filePath0Tool);

        if( jsonStringValues.isNotEmpty ) {
          Map<String, String> jsonData = mappingLanguage( jsonStringValues);
          languages['${languageModel.languageCode}_${languageModel.countryCode}'] = jsonData;
        }
      }
    }else{
      for(LanguageModel languageModel in langues) {
        String filePath0Tool = '$packagesNameBrain_dev_tools/assets/locale/i18n_${languageModel.languageCode}.json';
        String filePath1 = '$assetsPathLanguage/i18n_${languageModel.languageCode}.json';

        final mergedJson = await mergeJsonFiles(filePath1, filePath0Tool);
        if( mergedJson.isNotEmpty ) {
          Map<String, String> jsonData = mappingLanguage( mergedJson);
          languages['${languageModel.languageCode}_${languageModel.countryCode}'] = jsonData;
        }
      }
    }
    return languages;
  }

  static appTranslatorWithMerge() async
  {
    var appLanguages = EnvironmentVariable.appLanguages;
    String assetsPathLanguage = EnvironmentVariable.assetsPathLanguage;
    String assetsPathLanguageToMerge = EnvironmentVariable.assetsPathLanguageToMerge;
    if (appLanguages.isEmpty) {
      appLanguages = L10n.languages_en_fr_es_ht;
    }

    if (assetsPathLanguageToMerge.isNotEmpty) {
      //region  Retrieving localized data
      Map<String, Map<String, String>> languages = {};
      for (LanguageModel languageModel in appLanguages) {
        String filePath0Tool = '$packagesNameBrain_dev_tools/assets/locale/i18n_${languageModel.languageCode}.json';
        String filePath1 = '$assetsPathLanguage/i18n_${languageModel.languageCode}.json';
        String filePath2 = '$assetsPathLanguageToMerge/i18n_${languageModel.languageCode}.json';

        final mergedJson0 = await mergeJsonFiles(filePath1, filePath2);

        String jsonStringPath0Tool =  await rootBundle.loadString(filePath0Tool);
        final mergedJson = await mergeJsonObjects(mergedJson0, jsonStringPath0Tool);

        if (mergedJson.isNotEmpty) {
          Map<String, String> jsonData = mappingLanguage( mergedJson);
          languages['${languageModel.languageCode}_${languageModel.countryCode}'] = jsonData;
        }
      }
      return languages;
    } else {
      return await appTranslator();
    }
  }

  static Map<String, String> mappingLanguage(String jsonStringValues)
  {
    Map<String, String> jsonData = {};
    if( jsonStringValues.isNotEmpty ) {
      Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
      mappedJson.forEach((key, value) {
        jsonData[key] = value.toString();
      });
      return jsonData;
    }
    return jsonData;
  }

  static Future<String> mergeJsonFiles(String filePath1, String filePath2) async {
    // Charger les fichiers JSON en tant que String
    String jsonStringValues1 =  await rootBundle.loadString(filePath1);
    String jsonStringValues2 =  await rootBundle.loadString(filePath2);

    // Fusionner les Map (les valeurs de map1 sont prioritaires sur celles de map2)
    String mergedMap = await mergeJsonObjects(jsonStringValues1, jsonStringValues2);

    // Encoder le résultat en JSON
    return mergedMap;
  }

  static Future<String> mergeJsonObjects(String json1, String json2) async {
    // Décoder les chaînes JSON en Map
    final Map<String, dynamic> map1 = jsonDecode(json1);
    final Map<String, dynamic> map2 = jsonDecode(json2);

    // Fusionner les Maps en priorisant les valeurs de map1
    final Map<String, dynamic> mergedMap = {...map2, ...map1};

    // Retourner la Map fusionnée comme JSON
    return jsonEncode(mergedMap);
  }

}