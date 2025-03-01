import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';
import 'package:flutter/material.dart';

// List<Language> languageFromJson(String str) =>
//     List<Language>.from(json.decode(str).map((x) => Language.fromJson(x)));
//
// String languageToJson(List<Language> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LangueModel {
  LangueModel({this.name = '', this.value = '', this.flag = ''});

  String name = '';
  String value = '';
  String flag = '';

  String get id => value;

  String get nameDefault => name;

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
        'flag': flag,
      };

//region [ ConvertFromJson ]
  static List<LangueModel> fromJsonList(var data) => data
      .map<LangueModel>((json) => LangueModel.fromJson(json))
      .toList();

  factory LangueModel.fromJson(Map<String, dynamic> map) {
    LangueModel obj = LangueModel();
    obj.name = TypeSafeConversion.nullSafeString(map['name']);
    obj.value = TypeSafeConversion.nullSafeString(map['value']);
    obj.flag = TypeSafeConversion.nullSafeString(map['flag']);
    return obj;
  }
//endregion
}

class LanguageModel {
  String imageUrl;
  String languageName;
  String languageCode;
  String countryCode;
  String emoji;

  Locale get local => Locale(languageCode, countryCode);

  LanguageModel(
      {this.imageUrl = '',
      this.languageName = '',
      this.countryCode = '',
      this.languageCode = '',
      this.emoji = ''});

  factory LanguageModel.fromJson(Map<String, dynamic> map) {
    LanguageModel obj = LanguageModel();
    obj.imageUrl = TypeSafeConversion.nullSafeString(map['imageUrl']);
    obj.languageName = TypeSafeConversion.nullSafeString(map['languageName']);
    obj.countryCode = TypeSafeConversion.nullSafeString(map['countryCode']);
    obj.languageCode = TypeSafeConversion.nullSafeString(map['languageCode']);
    obj.emoji = TypeSafeConversion.nullSafeString(map['emoji']);
    return obj;
  }

  Map<String, dynamic> toJson() => {
    'imageUrl': imageUrl,
    'languageName': languageName,
    'countryCode': countryCode,
    'languageCode': languageCode,
    'emoji': emoji,
  };
}
