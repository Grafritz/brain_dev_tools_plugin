import 'dart:convert';

import 'package:brain_dev_tools/dao/entities/properties/device_app_version_property.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';

DeviceAppVersionModel deviceAppVersionFromJson(String str) =>
    DeviceAppVersionModel.convertFromJson(json.decode(str));

class DeviceAppVersionModel {
  String packageName = '';
  String appName = '';
  String applicationId = '';
  String versionName = '';
  String versionCode = '';
  int buildNumber = 0;

  String get versionNameAndBuildNumber => '$versionName.$buildNumber';
  bool isRequired = false;
  String versionInfo = '';
  String linkAndroid = '';
  String linkApple = '';
  String linkWebSite = '';
  String dateCreated = '';
  String currentVersionNameAndBuildNumber = '';

  DeviceAppVersionModel({
    this.packageName = '',
    this.appName = '',
    this.applicationId = '',
    this.versionName = '',
    this.versionCode = '',
    this.buildNumber = 0,
    this.isRequired = false,
    this.versionInfo = '',
    this.linkAndroid = '',
    this.linkApple = '',
    this.linkWebSite = '',
  });

  Map<String, dynamic> toJson() => {
    DeviceAppVersionProperty.packageName.columnName: packageName,
    DeviceAppVersionProperty.appName.columnName: appName,
    DeviceAppVersionProperty.applicationId.columnName: applicationId,
    DeviceAppVersionProperty.versionName.columnName: versionName,
    DeviceAppVersionProperty.versionCode.columnName: versionCode,
    DeviceAppVersionProperty.buildNumber.columnName: buildNumber,
    DeviceAppVersionProperty.isRequired.columnName: isRequired,
    DeviceAppVersionProperty.versionInfo.columnName: versionInfo,
    DeviceAppVersionProperty.linkAndroid.columnName: linkAndroid,
    DeviceAppVersionProperty.linkApple.columnName: linkApple,
    DeviceAppVersionProperty.linkWebSite.columnName: linkWebSite
  };

  factory DeviceAppVersionModel.convertFromJson(Map<String, dynamic> map) {
    var user = DeviceAppVersionModel(
      packageName: TypeSafeConversion.nullSafeString(
          map[DeviceAppVersionProperty.packageName.columnName]),
      appName: TypeSafeConversion.nullSafeString(
          map[DeviceAppVersionProperty.appName.columnName]),
      applicationId: TypeSafeConversion.nullSafeString(
          map[DeviceAppVersionProperty.applicationId.columnName]),
      versionName: TypeSafeConversion.nullSafeString(
          map[DeviceAppVersionProperty.versionName.columnName]),
      versionCode: TypeSafeConversion.nullSafeString(
          map[DeviceAppVersionProperty.versionCode.columnName]),
      buildNumber: TypeSafeConversion.nullSafeInt(
          map[DeviceAppVersionProperty.buildNumber.columnName]),
      isRequired: TypeSafeConversion.nullSafeBool(
          map[DeviceAppVersionProperty.isRequired.columnName]),
      versionInfo: TypeSafeConversion.nullSafeString(
          map[DeviceAppVersionProperty.versionInfo.columnName]),
      linkAndroid: TypeSafeConversion.nullSafeString(
          map[DeviceAppVersionProperty.linkAndroid.columnName]),
      linkApple: TypeSafeConversion.nullSafeString(
          map[DeviceAppVersionProperty.linkApple.columnName]),
      linkWebSite: TypeSafeConversion.nullSafeString(
          map[DeviceAppVersionProperty.linkWebSite.columnName]),
    );
    return user;
  }
}
