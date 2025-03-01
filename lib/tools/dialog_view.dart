import 'package:bot_toast/bot_toast.dart';
import 'package:brain_dev_tools/tools/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/color_resources.dart';

class DialogViews extends StatelessWidget {
  const DialogViews({super.key, required this.msg, this.eors = "E"});
  final String msg;
  final String eors;

  @override
  Widget build(BuildContext context) {
    String title = 'msg_title_Attention'.tr;
    if (eors == "S") title = 'msg_title_Information'.tr;
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: (eors == "S") ? Colors.black : Colors.red,
        ),
      ), // textScaleFactor: 1.0,
      content: Text(msg),
      contentPadding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: (eors == "S") ? Colors.green : Colors.red,
          ),
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class DialogView {
  static Future<void> showAlertDialog(
      {required String msg, String eors = "E"}) async
  {
    String title = 'msg_title_Attention'.tr;
    if (eors == "S") title = 'msg_title_Information'.tr;
    return showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: (eors == "S") ? Colors.black : Colors.red,
              ),
            ), // textScaleFactor: 1.0,
            content: Text(msg),
            contentPadding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            actions: <Widget>[
              MyElevatedButton(
                style: elevatedButtonNormal(
                  backgroundColor: (eors == "S") ? Colors.green : Colors.red,
                  textColor: Colors.white,
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  //region [ TOAST ]
  static showAlertToast(
      {required String msg, Alignment? alignment, String eors = "i"}) {
    showToast(msg, alignment: alignment, eors: eors);
  }

  static showToast(String msg, {Alignment? alignment, String eors = "i"}) {
    alignment ??= Alignment.bottomCenter;
    Color contentColor = Colors.black87;
    switch (eors.toUpperCase()) {
      case 'E':
        contentColor = Colors.red;
        break;
      case 'S':
        contentColor = Colors.teal;
        break;
      default:
        contentColor = Colors.black87;
    }

    // Toast.show(msg, context, gravity: gravity, duration: 3);
    BotToast.showText(
        text: msg,
        duration: const Duration(seconds: 3),
        // onlyOne: onlyOne,
        // clickClose: clickClose,
        // crossPage: crossPage,
        // backButtonBehavior: backButtonBehavior,
        align: alignment,
        // animationDuration:
        // Duration(milliseconds: animationMilliseconds),
        // animationReverseDuration:
        // Duration(milliseconds: animationReverseMilliseconds),
        textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        // borderRadius: BorderRadius.circular(borderRadius.toDouble()),
        // backgroundColor: Colors.black87,
        contentColor: contentColor);
  }

  //endregion

//region [ CONFIRMATION ]
  static Future<void> confirmationSuppression(
      {required Widget widgetContentMsg,
      Function()? onPressedOui,
      Function()? onPressedNo,
      String? dialogTitle}) async {
    String title =
        (dialogTitle == null) ? 'msg_title_Attention'.tr : dialogTitle;
    return showDialog(
        context: Get.context!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.1, 0.8],
                    colors: [Theme.of(context).primaryColor, Colors.black]),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(title,
                  style: TextStyle(color: ColorResources.getColor())),
            ),
            titlePadding:
                const EdgeInsets.only(left: 0.0, right: 0.0, top: 0, bottom: 0),
            content: widgetContentMsg,
            //Text(translator((isDeleteAll)?'msg_confirmation_suppression_all_note':'msg_confirmation_suppression_one_note')),
            actions: <Widget>[
              TextButton(
                onPressed: onPressedOui,
                child: Text('label_Oui'.tr),
              ),
              MyElevatedButton(
                style: elevatedButtonNormal(),
                onPressed: onPressedNo ?? () {
                        Navigator.pop(Get.context!);
                      },
                child: Text('label_Non'.tr.toUpperCase()),
              ),
            ],
          );
        });
  }

//endregion
}

class DialogView2 {
  static Future<void> showAlertDialog(
      {required BuildContext context,
      required String msg,
      String eors = "E"}) async {
    String title = 'msg_title_Attention'.tr;
    if (eors == "S") title = 'msg_title_Information'.tr;

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: (eors == "S") ? Colors.black : Colors.red,
              ),
            ), // textScaleFactor: 1.0,
            content: Text(msg),
            contentPadding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            actions: <Widget>[
              MyElevatedButton(
                style: elevatedButtonNormal(
                  backgroundColor: (eors == "S") ? Colors.green : Colors.red,
                  textColor: Colors.white,
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  //region [ TOAST ]
  static showToast(String msg, {Alignment? alignment, String eors = "i"}) {
    alignment ??= Alignment.bottomCenter;
    Color contentColor = Colors.black87;
    switch (eors.toUpperCase()) {
      case 'E':
        contentColor = Colors.red;
        break;
      case 'S':
        contentColor = Colors.teal;
        break;
      default:
        contentColor = Colors.black87;
    }

    // Toast.show(msg, context, gravity: gravity, duration: 3);
    BotToast.showText(
        text: msg,
        duration: const Duration(seconds: 3),
        // onlyOne: onlyOne,
        // clickClose: clickClose,
        // crossPage: crossPage,
        // backButtonBehavior: backButtonBehavior,
        align: alignment,
        // animationDuration:
        // Duration(milliseconds: animationMilliseconds),
        // animationReverseDuration:
        // Duration(milliseconds: animationReverseMilliseconds),
        textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        // borderRadius: BorderRadius.circular(borderRadius.toDouble()),
        // backgroundColor: Colors.black87,
        contentColor: contentColor);
  }
//endregion
}
