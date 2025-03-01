
import 'package:brain_dev_tools/dao/entities/properties/device_info_property.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';

class DeviceInfoModel {
  String systemName;
  bool isPhysicalDevice;
  String model;
  String localizedModel;
  String name;
  String identifierForVendor;
  String userName;
  String fcmOldToken;
  String fcmNewToken;
  String buildName;
  String buildNumber;

  DeviceInfoModel({
    this.systemName = '',
    this.isPhysicalDevice = false,
    this.model = '',
    this.localizedModel = '',
    this.name = '',
    this.identifierForVendor = '',
    this.userName = '',
    this.fcmOldToken = '',
    this.fcmNewToken = '',
    this.buildName = '',
    this.buildNumber = '',
  });

  factory DeviceInfoModel.fromJson(Map<String, dynamic> map) {
    var user = DeviceInfoModel(
      systemName: TypeSafeConversion.nullSafeString(
          map[DeviceInfoProperty.systemName.columnName]),
      isPhysicalDevice: TypeSafeConversion.nullSafeBool(
          map[DeviceInfoProperty.isPhysicalDevice.columnName]),
      model: TypeSafeConversion.nullSafeString(
          map[DeviceInfoProperty.model.columnName]),
      localizedModel: TypeSafeConversion.nullSafeString(
          map[DeviceInfoProperty.localizedModel.columnName]),
      name: TypeSafeConversion.nullSafeString(
          map[DeviceInfoProperty.name.columnName]),
      identifierForVendor: TypeSafeConversion.nullSafeString(
          map[DeviceInfoProperty.identifierForVendor.columnName]),
      userName: TypeSafeConversion.nullSafeString(
          map[DeviceInfoProperty.userName.columnName]),
      fcmOldToken: TypeSafeConversion.nullSafeString(
          map[DeviceInfoProperty.fcmOldToken.columnName]),
      fcmNewToken: TypeSafeConversion.nullSafeString(
          map[DeviceInfoProperty.fcmNewToken.columnName]),
      buildName: TypeSafeConversion.nullSafeString(
          map[DeviceInfoProperty.buildName.columnName]),
      buildNumber: TypeSafeConversion.nullSafeString(
          map[DeviceInfoProperty.buildNumber.columnName]),
    );
    return user;
  }

  Map<String, dynamic> toJson() => {
        DeviceInfoProperty.systemName.columnName: systemName,
        DeviceInfoProperty.isPhysicalDevice.columnName: isPhysicalDevice,
        DeviceInfoProperty.model.columnName: model,
        DeviceInfoProperty.localizedModel.columnName: localizedModel,
        DeviceInfoProperty.name.columnName: name,
        DeviceInfoProperty.identifierForVendor.columnName: identifierForVendor,
        DeviceInfoProperty.userName.columnName: userName,
        DeviceInfoProperty.fcmOldToken.columnName: fcmOldToken,
        DeviceInfoProperty.fcmNewToken.columnName: fcmNewToken,
        DeviceInfoProperty.buildName.columnName: buildName,
        DeviceInfoProperty.buildNumber.columnName: buildNumber,
      };

/*
  BaseDeviceInfo{
    data:
    {
      systemName: iOS,
      isPhysicalDevice: false,
      utsname: {
        release: 22.5.0,
        sysname: Darwin,
        nodename: Jeans-MBP-2.cog eco.local,
        machine: iPhone15,3,
        version: Darwin Kernel Version 22.5.0: Mon Apr 24 20:52:24 PDT 2023; root:xnu-8796.121.2~5/RELEASE_ARM64_T6000
      },
      model: iPhone,
      localizedModel: iPhone,
      systemVersion: 16.4,
      name: iPhone 14 Pro Max,
      identifierForVendor: A5258669-AC7F-44C1-9ED9-84E3741CC876
    }
  }

  */
}
