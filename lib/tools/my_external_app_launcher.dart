import 'dart:async';
import 'dart:io';

import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:flutter/services.dart';

class MyLaunchApp {
  /// Method channel declaration
  static const MethodChannel _channel = MethodChannel('launch_vpn');

  /// Getter for platform version
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// Function to check if app is installed on device
  /// returns boolean
  static isAppInstalled(
      {String? iosUrlScheme, String? androidPackageName}) async {
    String packageName = Platform.isIOS ? iosUrlScheme! : androidPackageName!;
    if (packageName.isEmpty) {
      throw Exception('The package name can not be empty');
    }
    dynamic isAppInstalled = await _channel
        .invokeMethod('isAppInstalled', {'package_name': packageName});
    return isAppInstalled;
  }

  /// Function to launch the external app
  /// or redirect to store
  static Future<int> openApp(
      {String? iosUrlScheme,
      String? androidPackageName,
      String? appStoreLink,
      bool? openStore}) async {
    String? packageName = Platform.isIOS ? iosUrlScheme : androidPackageName;
    String packageVariableName =
        Platform.isIOS ? 'iosUrlScheme' : 'androidPackageName';
    if (packageName == null || packageName == "") {
      throw Exception('The $packageVariableName can not be empty');
    }
    if (Platform.isIOS && appStoreLink == null && openStore != false) {
      openStore = false;
    }

    return await _channel.invokeMethod('openApp', {
      'package_name': packageName,
      'open_store': openStore == false ? "false" : "open it",
      'app_store_link': appStoreLink
    }).then((value) {
      if (value == "app_opened") {
        logCat("app opened successfully");
        return 1;
      } else {
        if (value == "navigated_to_store") {
          if (Platform.isIOS) {
            logCat(
                "Redirecting to AppStore as the app is not present on the device");
          } else {
            logCat(
                "Redirecting to Google Play Store as the app is not present on the device");
          }
        } else {
          logCat(value);
        }
        return 0;
      }
    });
  }
// }
}
