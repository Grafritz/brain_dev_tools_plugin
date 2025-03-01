import 'dart:io';

import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/my_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogAlertOnPressBack extends StatefulWidget {
  const DialogAlertOnPressBack({super.key});

  @override
  State<DialogAlertOnPressBack> createState() => _DialogAlertOnPressBackState();
}

class _DialogAlertOnPressBackState extends State<DialogAlertOnPressBack> {
  @override
  Widget build(BuildContext context) {
    if( checkPlatform.isIOS){
      return alertDialogIos();
    }
    return alertDialogAndroid();
  }

  alertDialogAndroid(){
    return AlertDialog(
      title: Text('msg_QuitterApplication'.tr,
        textAlign: TextAlign.center,
      ), // textScaleFactor: 1.0,
      //contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      actions: <Widget>[
        TextButton(
          child: Text('label_Quitter'.tr),
          onPressed: () {
            exit(0);
          },
        ),
        MyElevatedButton(
          style: elevatedButtonNormal(),
          child: Text('label_Rester'.tr),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  alertDialogIos(){
    return CupertinoAlertDialog(
      title: Text('msg_QuitterApplication'.tr,
        textAlign: TextAlign.center,
      ), // textScaleFactor: 1.0,
      //contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      actions: <Widget>[
        TextButton(
          child: Text('label_Quitter'.tr),
          onPressed: () {
            exit(0);
          },
        ),
        MyElevatedButton(
          style: elevatedButtonNormal(),
          child: Text('label_Rester'.tr),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget data(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text('msg_QuitterApplication'.tr, textAlign: TextAlign.center),
      titlePadding: const EdgeInsets.only(left: 10.0, right: 0.0, top: 0, bottom: 0),
      content: Text.rich(TextSpan(children: [
        const WidgetSpan(child: Icon(Icons.stars, size: 10, color: Colors.grey)),
          TextSpan(
              text: '\n${'label_Quitter'.tr}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
      ])),
      contentPadding:
      const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      actions: <Widget>[
        // adaptiveAction(
        //   onPressed: () => Navigator.pop(context, 'Cancel'),
        //   child: Text('label_ignorer'.tr),
        // ),
          adaptiveAction(
            onPressed: () => Navigator.pop(context),
            isDestructiveAction: true,
            child: Text('label_Quitter'.tr),
          ),
        adaptiveAction(
          onPressed: () async {
            //await MyLauncher.launchInBrowser(Constant.urlAppleOrGoogleStoreCCG());
            Navigator.pop(Get.context!);
          },
          isDefaultAction: true,
          child: Text('label_update_now'.tr),
        ),
      ],
    );
  }
}
Future<bool> onPressBackShowAlertDialog() async {
  return showAdaptiveDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogAlertOnPressBack();
      }).then((value) => value!);
}
Future<bool> onPressBackShowAlertDialog1() async {
  return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogAlertOnPressBack();
      }).then((value) => value!);
}