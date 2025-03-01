import 'package:brain_dev_tools/tools/constant.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
// import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'my_external_app_launcher.dart';

class MyLauncher {
  /*static Future isAppLSBInstalled() async {
    try {
      // var isAppInstalledResult = await LaunchApp.isAppInstalled(
      //   androidPackageName: Constant.packageLaSainteBible,
      //   iosUrlScheme: '${Constant.packageLaSainteBible}://',
      //   // openStore: false
      // );
      //logCat('isAppInstalledResult => $isAppInstalledResult ${isAppInstalledResult.runtimeType}');
    } catch (ex) {
      logError(ex);
      await launchInBrowser(Constant.urlAppleOrGoogleStoreLSB());
    }
  }

  static Future openAppLSB() async {
    try {
      // await LaunchApp.openApp(
      //   androidPackageName: Constant.packageLaSainteBible,
      //   //iosUrlScheme: 'labible.grafritz.com://',
      //   //'${Constant.packageLaSainteBible}://',
      //   appStoreLink: Constant.urlAppleStoreLSB,
      //   //openStore: false
      // );
    } catch (ex) {
      logError(ex);
      await launchInBrowser(Constant.urlAppleOrGoogleStoreLSB());
    }
  }

  static Future openAppCCG() async {
    try {
      // await LaunchApp.openApp(
      //   androidPackageName: Constant.packageChantChoraleEtGroupe,
      //   iosUrlScheme: '${Constant.packageLaSainteBible}://',
      //   appStoreLink: Constant.urlAppleStoreLSB,
      //   //openStore: true
      // );
    } catch (ex) {
      logError(ex);
      await launchInBrowser(Constant.urlAppleOrGoogleStoreLSB());
    }
  }*/

  static Future<void> launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInAppBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    )) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInWebViewOrVC(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchUniversalLinkIos(String url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.inAppWebView,
      );
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

}