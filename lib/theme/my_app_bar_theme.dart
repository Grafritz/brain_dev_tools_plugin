
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:brain_dev_tools/tools/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBarTheme extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarTheme({
    super.key,
    required this.title,
    this.titleWidget,
    this.elevation,
    this.centerTitle,
    this.actions,
    this.systemOverlayStyle,
    this.backgroundColor,
    this.color,
    this.automaticallyImplyLeading = true,
    this.iconTheme,
    this.leading,
    this.showLeading=true,
    this.bottom,
  });

  final title;
  final Widget? titleWidget, leading;
  final double? elevation;
  final bool? centerTitle;
  final bool showLeading;
  final List<Widget>? actions;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Color? backgroundColor, color;
  final bool automaticallyImplyLeading;
  final IconThemeData? iconTheme;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: systemOverlayStyle,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
      iconTheme: iconTheme,
      //leading: leading,
      leading: !showLeading?null: GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_circle_left_outlined, color: ColorResources.getPrimaryColorDarkColor(),
      ),
    ),
      elevation: elevation,
      centerTitle: centerTitle,
      title: getTitle(),
      //Text(title, style: const TextStyle(fontFamily: 'Brandon')),
      actions: actions,
      bottom: bottom,
    );
  }

  getTitle() {
    try {
      if (titleWidget != null) {
        return titleWidget;
      }
      return Text(title, style: TextStyle(fontFamily: 'Brandon', color: color));
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'getTitle');
      return null;
    }
  }

  @override
  //Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => const Size(double.maxFinite, 56.0);
}
