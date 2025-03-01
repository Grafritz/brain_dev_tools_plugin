import 'dart:convert';

import 'package:flutter/material.dart';

List<Language> languageFromJson(String str) =>
    List<Language>.from(json.decode(str).map((x) => Language.fromJson(x)));

String languageToJson(List<Language> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Language {
  Language({
    required this.id,
    required this.code,
    required this.name,
  });

  int id;
  String code;
  String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "language": name,
      };
}
class LanguageModel {
  final String imageUrl;
  final String languageName;
  final String languageCode;
  final String countryCode;
  Locale get local => Locale(languageCode, countryCode);

  LanguageModel({this.imageUrl='', this.languageName='', this.countryCode='', this.languageCode=''});
}
