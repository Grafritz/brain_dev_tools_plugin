import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final ButtonStyle? style;

  const MyElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    // if( checkPlatform.isIOS){
    //   return CupertinoButton(
    //       onPressed: onPressed,
    //       child: child!,
    //   );
    // }
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: child,
    );
  }
}
elevatedButtonNormalV1({Color? color, Color? textColor, OutlinedBorder? shape}) =>
    ElevatedButton.styleFrom(
      backgroundColor: (color == null) ? Theme.of(Get.context!).primaryColor : color,
      foregroundColor: (textColor == null) ? Colors.white : textColor,
      shape: shape,
    );
elevatedButtonNormal({
  Color? backgroundColor,
  Color? textColor,
  OutlinedBorder? shape,
  double? elevation,
  EdgeInsetsGeometry? padding
}) =>
    ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: (backgroundColor == null)
            ? Theme.of(Get.context!).primaryColor
            : backgroundColor,
        foregroundColor: (textColor == null) ? Colors.white : textColor,
        shape: shape,
        padding: padding);


Widget adaptiveAction(
    {required VoidCallback onPressed,
      required Widget child,
      bool isDefaultAction = false,
      bool isDestructiveAction = false}) {
  final ThemeData theme = Theme.of(Get.context!);
  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return TextButton(onPressed: onPressed, child: child);
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return CupertinoDialogAction(
        onPressed: onPressed,
        isDefaultAction: isDefaultAction,
        isDestructiveAction: isDestructiveAction,
        child: child,
      );
  }
}