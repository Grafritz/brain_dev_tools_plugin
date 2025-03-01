import 'package:brain_dev_tools/models/security/device_app_version_model.dart';
import 'package:brain_dev_tools/tools/constant.dart';
import 'package:brain_dev_tools/tools/my_elevated_button.dart';
import 'package:brain_dev_tools/tools/my_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogReminderUpdate extends StatelessWidget {
  const DialogReminderUpdate({super.key, required this.deviceAppVersion});

  final DeviceAppVersionModel deviceAppVersion;

  @override
  Widget build(BuildContext context) {
    String content = 'msg_update_app'.trParams({
      'appName': deviceAppVersion.appName,
      'versionAvailable': deviceAppVersion.versionNameAndBuildNumber,
      'currentVersion': deviceAppVersion.currentVersionNameAndBuildNumber,
    });
    return AlertDialog.adaptive(
      title: Text('label_new_update'.tr, textAlign: TextAlign.center),
      titlePadding:
          const EdgeInsets.only(left: 10.0, right: 0.0, top: 0, bottom: 0),
      content: Text.rich(TextSpan(children: [
        const WidgetSpan(child: Icon(Icons.stars, size: 10, color: Colors.grey)),
        TextSpan(text: content),
        if (deviceAppVersion.versionInfo.isNotEmpty)
          TextSpan(
              text: '\n${'label_release_notes'.tr}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
        if (deviceAppVersion.versionInfo.isNotEmpty)
          TextSpan(text: '\n${deviceAppVersion.versionInfo}'),
      ])),
      contentPadding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      actions: <Widget>[
        // adaptiveAction(
        //   onPressed: () => Navigator.pop(context, 'Cancel'),
        //   child: Text('label_ignorer'.tr),
        // ),
        if (!deviceAppVersion.isRequired)
          adaptiveAction(
            onPressed: () => Navigator.pop(context),
            isDestructiveAction: true,
            child: Text('label_later'.tr),
          ),
        adaptiveAction(
          onPressed: () async {
            await MyLauncher.launchInBrowser(Constant.urlAppleOrGoogleStoreCCG());
            Navigator.pop(Get.context!);
          },
          isDefaultAction: true,
          child: Text('label_update_now'.tr),
        ),
      ],
    );

    /*return AlertDialog(
      title: Row(
        children: <Widget>[
          Text(Constant.appName, textAlign: TextAlign.center),
          const Spacer(),
          IconButton(icon: const Icon(Icons.close),
              color: ColorResources.getColor( color: Colors.black),
              onPressed: () => Navigator.pop(context)),
        ],
      ),
      titlePadding: const EdgeInsets.only(left: 10.0, right: 0.0, top: 0, bottom: 0),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Text('msg_telecharger_la_version_et_la_langue'.tr, textAlign: TextAlign.center),
            const Divider(),
            getListTile(versionTitle: 'label_LangueCreole'.tr,
                nbrVersion: '2',
                langue: Langue.creole),
            const Divider(),
            getListTile(versionTitle: 'label_LangueFrancaise'.tr,
                nbrVersion: '7',
                langue: Langue.francais),
            const Divider(),
            getListTile(versionTitle: 'label_LangueAnglaise'.tr,
                nbrVersion: '6',
                langue: Langue.anglais),
            const Divider(),
            getListTile(versionTitle: 'label_LangueEspagnole'.tr,
                nbrVersion: '3',
                langue: Langue.espagnole),
          ],
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      actions: <Widget>[
        TextButton(
          child: Text('label_ne_plus_afficher'.tr),
          onPressed: () {
            //applicationController.getMySharedPref.setReminderDownloadVersionBible(false);
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text('label_Reminde_me'.tr),
          onPressed: () {
            //applicationController.getMySharedPref.setReminderDownloadVersionBible(true);
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          style: ToolsWidget().elevatedButtonNormal(),
          child: Text('label_Telecharger'.tr),
          onPressed: () {
            Navigator.pop(context);
            //RouteHelper.navVersionBible();
          },
        ),
      ],
    );*/
  }
}

Future onLoadDialogReminderUpdate(
    {required DeviceAppVersionModel deviceAppVersion}) async {
  return showAdaptiveDialog(
      context: Get.context!,
      barrierDismissible: !deviceAppVersion.isRequired,
      builder: (BuildContext context) {
        return DialogReminderUpdate(deviceAppVersion: deviceAppVersion);
      });
}

Future<void> onLoadDialogReminderUpdate1({
  required DeviceAppVersionModel deviceAppVersion
}) async {
  return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogReminderUpdate(deviceAppVersion: deviceAppVersion);
      });
}
