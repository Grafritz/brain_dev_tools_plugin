import 'dart:async';

import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs_lite.dart' as lite;
import 'package:get/get.dart';

class MyLauncherCustomTabs {

  Future<void> launchUrlCustom({ required String url }) async {
    final theme = Theme.of(Get.context!);
    try {
      await launchUrl(Uri.parse(url),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
            navigationBarColor: theme.colorScheme.surface,
          ),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
        ),
      );
    } catch (e) {
      // If the URL launch fails, an exception will be thrown. (For example, if no browser app is installed on the Android device.)
      debugPrint(e.toString());
    }
  }

  Future<void> launchUrlPage({ required String url }) async {
    final theme = Theme.of(Get.context!);
    try {
      await launchUrl(Uri.parse(url),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
            navigationBarColor: theme.colorScheme.surface,
          ),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
        ),
      );
    } catch (e) {
      // If the URL launch fails, an exception will be thrown. (For example, if no browser app is installed on the Android device.)
      debugPrint(e.toString());
    }
  }
  Future<void> launchURLInDefaultBrowserOnAndroid() async {
    final theme = Theme.of(Get.context!);
    try {
      await launchUrl(Uri.parse('https://flutter.dev'),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
            navigationBarColor: theme.colorScheme.surface,
          ),
          urlBarHidingEnabled: true,
          showTitle: true,
          browser: const CustomTabsBrowserConfiguration(
            prefersDefaultBrowser: true,
          ),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> launchUrlLite() async {
    final theme = Theme.of(Get.context!);
    try {
      await lite.launchUrl(
        Uri.parse('https://flutter.dev'),
        options: lite.LaunchOptions(
          barColor: theme.colorScheme.surface,
          onBarColor: theme.colorScheme.onSurface,
          barFixingEnabled: false,
        ),
      );
    } catch (e) {
      // If the URL launch fails, an exception will be thrown. (For example, if no browser app is installed on the Android device.)
      debugPrint(e.toString());
    }
  }

  Future<void> launchDeepLinkURL() async {
    final theme = Theme.of(Get.context!);
    final uri = checkPlatform.isIOS
        ? 'https://maps.apple.com/?q=tokyo+station'
        : 'https://www.google.co.jp/maps/@35.6908883,139.7865242,13.53z';
    try {
      await launchUrl(
        Uri.parse(uri),
        prefersDeepLink: true,
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
            navigationBarColor: theme.colorScheme.surface,
          ),
          urlBarHidingEnabled: true,
          showTitle: true,
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> launchUrlInBottomSheet() async {
    final theme = Theme.of(Get.context!);
    final mediaQuery = MediaQuery.of(Get.context!);
    try {
      await launchUrl(
        Uri.parse('https://flutter.dev'),
        customTabsOptions: CustomTabsOptions.partial(
          configuration: PartialCustomTabsConfiguration(
            initialHeight: mediaQuery.size.height * 0.7,
          ),
          colorSchemes: CustomTabsColorSchemes.defaults(
            colorScheme: theme.brightness.toColorScheme(),
            toolbarColor: theme.colorScheme.primary,
          ),
          showTitle: true,
        ),
        safariVCOptions: SafariViewControllerOptions.pageSheet(
          configuration: const SheetPresentationControllerConfiguration(
            detents: {
              SheetPresentationControllerDetent.large,
              SheetPresentationControllerDetent.medium,
            },
            prefersScrollingExpandsWhenScrolledToEdge: true,
            prefersGrabberVisible: true,
            prefersEdgeAttachedInCompactHeight: true,
            preferredCornerRadius: 16.0,
          ),
          preferredBarTintColor: theme.colorScheme.primary,
          preferredControlTintColor: theme.colorScheme.onPrimary,
          entersReaderIfAvailable: true,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> launchWithCustomCloseButton() async {
    final theme = Theme.of(Get.context!);
    try {
      await launchUrl(
        Uri.parse('https://flutter.dev'),
        customTabsOptions: CustomTabsOptions(
            colorSchemes: CustomTabsColorSchemes.defaults(
              toolbarColor: theme.colorScheme.surface,
            ),
            showTitle: true,
            closeButton: CustomTabsCloseButton(
              icon: CustomTabsCloseButtonIcons.back,
            )),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> launchWithCustomAnimation2({ required String url}) async {
    final theme = Theme.of(Get.context!);
    try {
      await launchUrl(
        Uri.parse(url),
        // Android Custom Tabs config
        customTabsOptions: CustomTabsOptions(
          urlBarHidingEnabled: true,
          instantAppsEnabled: false,
          showTitle: false,
          browser: const CustomTabsBrowserConfiguration(
            prefersDefaultBrowser: false,
          ),
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
          ),
          animations: CustomTabsSystemAnimations.fade(),
        ),
        // iOS Safari View Controller config
        safariVCOptions: SafariViewControllerOptions(
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          modalPresentationStyle: ViewControllerModalPresentationStyle.automatic,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  Future<void> launchWithCustomAnimation({ required String url, bool showTitle = false }) async {
    final theme = Theme.of(Get.context!);
    try {
      await launchUrl(
        Uri.parse(url),
        customTabsOptions: CustomTabsOptions(
          urlBarHidingEnabled: false,
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
          ),
          showTitle: showTitle,
          animations: CustomTabsSystemAnimations.fade(),
        ),
        safariVCOptions: SafariViewControllerOptions(
          barCollapsingEnabled: false,
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          modalPresentationStyle: ViewControllerModalPresentationStyle.automatic,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> launchAndCloseManually() async {
    final theme = Theme.of(Get.context!);
    try {
      Timer(const Duration(seconds: 5), () {
        closeCustomTabs();
      });

      await launchUrl(
        Uri.parse('https://flutter.dev'),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
          ),
          showTitle: true,
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> launchInExternalBrowser() async {
    try {
      await launchUrl(
        Uri.parse('https://flutter.dev'),
        prefersDeepLink: false,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}
MyLauncherCustomTabs myLauncherCustomTabs = MyLauncherCustomTabs();