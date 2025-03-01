import 'dart:convert';

import 'package:brain_dev_tools/dao/entities/properties/settings_property.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';

SettingsModel settingsFromJson(String str) =>
    SettingsModel.fromJson(json.decode(str));

String settingsToJson(SettingsModel data) => json.encode(data.toJson());

class SettingsModel {
  SettingsModel({
    required this.id,
    this.fcmKey = '',
    this.autoApprove = false,
    this.privacyPolicy = '',
    this.termsAndConditions = '',
    //this.createdAt = const ConstDateTime(0),
    //this.updatedAt = const ConstDateTime(0),
  });

  String id;
  String fcmKey;
  bool autoApprove;
  String privacyPolicy;
  String termsAndConditions;

  //DateTime createdAt;
  //DateTime updatedAt;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
        id: TypeSafeConversion.nullSafeString(
            json[SettingsProperty.id.columnName]),
        fcmKey: TypeSafeConversion.nullSafeString(
            json[SettingsProperty.fcmKey.columnName]),
        autoApprove: TypeSafeConversion.nullSafeBool(
            json[SettingsProperty.isAutoApprove.columnName]),
        privacyPolicy: TypeSafeConversion.nullSafeString(
            json[SettingsProperty.privacyPolicy.columnName]),
        termsAndConditions: TypeSafeConversion.nullSafeString(
            json[SettingsProperty.termsAndConditions.columnName]),
        //createdAt: DateTime.parse(json["created_at.columnName]),
        //updatedAt: DateTime.parse(json["updated_at.columnName]),
      );

  Map<String, dynamic> toJson() => {
        SettingsProperty.id.columnName: id,
        SettingsProperty.fcmKey.columnName: fcmKey,
        SettingsProperty.isAutoApprove.columnName: autoApprove,
        SettingsProperty.privacyPolicy.columnName: privacyPolicy,
        SettingsProperty.termsAndConditions.columnName: termsAndConditions,
        //SettingsProperty.created_at.columnName: createdAt.toIso8601String(),
        //SettingsProperty.updated_at.columnName: updatedAt.toIso8601String(),
      };
}
