import 'dart:convert';
import 'dart:math';

import 'package:brain_dev_tools/I10n/localization_constants.dart';
import 'package:brain_dev_tools/controllers/connectivity_controller.dart';
import 'package:brain_dev_tools/controllers/localization_controller.dart';
import 'package:brain_dev_tools/tools/a_variables.dart';
import 'package:brain_dev_tools/tools/dialog_view.dart';
import 'package:brain_dev_tools/tools/utils/dimensions.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';
import 'package:brain_dev_tools/tools/validation/validator.dart';
import 'package:brain_dev_tools/views/base/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

setConnectivity() {
  //DialogView.showAlertDialog(eors: 'E', msg: 'msg_No_Internet_connection'.tr);
  DialogView.showAlertToast(eors: 'i', msg: 'msg_No_Internet_connection'.tr);
  Get.find<ConnectivityController>().setIsInternetOk(false);
}

getTimeAgoFormat(String? value) {
  if (value != null && value.isNotEmpty) {
    String lang = Get.find<LocalizationController>().locale.languageCode;
    if (lang.isEmpty || lang == 'ht') {
      lang = 'fr';
    }
    final data = DateTime.parse(value);
    return timeago.format(data, locale: lang);
  }
  return '';
}

// Convert minutes into hours
String getDuration(String value) {
  if (TypeSafeConversion.nullSafeInt(value) > 60) {
    final int hour = int.parse(value) ~/ 60;
    final int minutes = int.parse(value) % 60;
    if (minutes != 0) {
      return '${hour.toString().padLeft(2)}h ${minutes.toString().padLeft(2, "0")}m';
    } else {
      return '${hour.toString().padLeft(2)}h';
    }
  } else {
    return '$value ';
  }
}

bool valdiateURL(String url) {
  bool valid = false;
  if (url.contains('http://') || url.contains('https://')) {
    valid = true;
  } else {
    valid = false;
  }
  return valid;
}

String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}


dataRefresh(var body) {
  return SizedBox(
    height: 55.0,
    child: Center(child: body),
  );
}

Future showCustomDialogWithTitle(
  BuildContext context, {
  String? title,
  required Widget body,
  required onTapSubmit,
}) async
{
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title != null ? Text(title) : Container(),
        content: SingleChildScrollView(child: body),
        actions: <Widget>[
          onTapSubmit != null
              ? TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: onTapSubmit,
                  child: Text('submit'.tr,
                      style: const TextStyle(color: Colors.white)),
                )
              : Container(),
        ],
      );
    },
  );
}


getImageOrIcon({required String photoPath, double width = Dimensions.IMAGE_PROFIL_WIDTH}) {
  if (photoPath.isNotEmpty) {
    bool isUr = isUrl(photoPath);
    if (isUr) {
      return CachedNetworkImage(
        imageUrl: photoPath,
        imageBuilder: (context, imageProvider) => Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => ShimmerWidget(
          width: width,
          height: width,
          circular: true,
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }
    bool isB64 = isBase64(photoPath);
    if (isB64) {
      return Image.memory(base64Decode(photoPath),
          width: width, fit: BoxFit.cover);
    }
  }

  return Material(
    elevation: 1,
    shape: const CircleBorder(),
    child: Icon(Icons.account_circle, size: width),
  );
}


getImage({ String? pathImage, IconData? icon, bool isImgOnline=false, Color? color, double? height }) {
  height ??= 55;
  if( pathImage!=null ) {
    if (isImgOnline) {
      return Image.network(pathImage, height: height, color: color);
    } else {
      return Image.asset(pathImage, height: height, color: color);
    }
  }

  if( icon!=null ) {
    return Icon(icon, size: height, color: color);
  }
}

heading({ required String title, String? pathImage, IconData? icon, Color? color }) {
  color = (color==null) ? Colors.black : color;
  return Row(
    children: <Widget>[
      getImage(color: color, height: 30, icon: icon, pathImage: pathImage),
      if( pathImage!=null || icon!=null  )
        const SizedBox( width: 10.0,),
      Expanded(
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
      )
    ],
  );
}

getHRWithText({required String text}) {
  return Row(
    children: <Widget>[
      Expanded(child: Divider(color: Colors.grey.shade600,)),
      const SizedBox(width: 10.0),
      Text(text,style: smallText,),
      const SizedBox(width: 10.0),
      Expanded(child: Divider(color: Colors.grey.shade600,)),
    ],
  );
}

getWidgetButton({required String text, required IconData icon, required MaterialColor bgColor, Function()? onPressed }) {
  return MaterialButton(
    onPressed: onPressed,
    child: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: bgColor
          ),
          child: Icon(icon, color: Colors.white,),
        ),
        Text(text),
      ],
    ),
  );
}

showDialogProgress( { required bool show, bool barrierDismissible=true }){
  if( !show ){
    Navigator.pop(Get.context!);
  }else {
    showDialog(
        context: Get.context!,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const CircularProgressIndicator(),
                    Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Text('${tr('connection_Wait')}',
                          style: const TextStyle(color: Colors.white),))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
getBadgeMaterial(String item,
    {Color materialColors = Colors.deepOrange,
      Color materialShadowColor = Colors.red,
      Color textColor = Colors.white,
      double materialElevation = 5.0,
      double fontSize= 12.0,
      FontWeight fontWeight= FontWeight.bold,
      double width= 25
    })
{
  return Material(
    color: materialColors,
    elevation: materialElevation,
    shadowColor: materialShadowColor,
    borderRadius: BorderRadius.circular(5.0),
    child: Container(
      width: width,
      height: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: materialColors,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        item,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
    ),
  );
}