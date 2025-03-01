import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'build_config.dart';

class CheckPlatform {
  static final CheckPlatform _singleton = CheckPlatform._internal();

  factory CheckPlatform() {
    return _singleton;
  }

  CheckPlatform._internal();

  bool get isDesktop =>
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.windows;

  bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

  bool get isDesktopSansMacOS =>
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.windows;

  bool get isWeb => kIsWeb;

  bool get isWebOrIsDesktop => isWeb || isDesktop;

  bool get isWebOrIsDesktopSansMacOS => isWeb || isDesktopSansMacOS;

  bool get isMobile =>
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;

  bool get isMobileOrWeb => isWeb || isMobile;

  bool get isApple =>
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS;

  bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  bool get isMacOS => defaultTargetPlatform == TargetPlatform.macOS;

  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;

//region [ initPackageState ]
  Future<PackageInfo> getPackageData() async {
    return await PackageInfo.fromPlatform();
  }

  Future<BuildConfig> initPackageState() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = "";
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      appName = /*await*/ packageInfo.appName;
    } on PlatformException {
      appName = 'Failed to get appName.';
    }
    String version;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      version = /*await*/ packageInfo.version;
    } on PlatformException {
      version = 'Failed to get version.';
    }

    String buildNumber;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      buildNumber = /*await*/ packageInfo.buildNumber;
    } on PlatformException {
      buildNumber = 'Failed to get buildNumber.';
    }

    String packageName;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      packageName = /*await*/ packageInfo.packageName;
    } on PlatformException {
      packageName = 'Failed to get packageName.';
    }
    //BuildConfig buildConfig = await Tools.initPackageState();
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) {
    //  return;
    //}

    //setState(() {
    //logCat("appName: $appName\n version:$version\n buildNumber:$buildNumber\n packageName:$packageName");
    BuildConfig buildConfig = BuildConfig();
    buildConfig.applicationId = packageName;
    buildConfig.packageName = packageName;
    buildConfig.versionName = version;
    buildConfig.versionCode = buildNumber;
    buildConfig.appName = appName;
    //});

    return buildConfig;
  }
//endregion
}

CheckPlatform checkPlatform = CheckPlatform();