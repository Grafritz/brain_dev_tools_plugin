import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolsWidget
{
  static getBadgeMaterial(String item,
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

  static getImageWidget({bool? isImageNetworkBg, String? imageBg}) {
    return ( TypeSafeConversion.nullSafeBool( isImageNetworkBg ))
        ? NetworkImage(imageBg!) : AssetImage('$imageBg');
  }

  static const TextStyle smallText = TextStyle(fontSize: 12.0);

  String formatTime({required Duration duration}) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  styleReward({double fontSize = 12}) => TextStyle(
        color: getColor(
            isDark: Get.isDarkMode,
            color: Theme.of(Get.context!).primaryColorDark),
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      );

  getColor({required bool isDark, Color color = Colors.white}) {
    //Tools.logCat('isDark: $isDark');
    return (!isDark) ? color : null;
  }

  static buildDividerWithContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }


}
ToolsWidget toolsWidget = ToolsWidget();
// elevatedButtonNormal({Color? color, Color? textColor, OutlinedBorder? shape}) =>
//     ElevatedButton.styleFrom(
//       foregroundColor: (textColor == null) ? Colors.white : textColor,
//       backgroundColor:
//           (color == null) ? Theme.of(Get.context!).primaryColor : color,
//       shape: shape,
//     );
