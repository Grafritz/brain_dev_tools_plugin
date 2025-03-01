import 'package:brain_dev_tools/controllers/theme_controller.dart';
import 'package:brain_dev_tools/tools/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyScaffoldBg extends StatelessWidget {
  const MyScaffoldBg({super.key, this.child, this.bgColor});
  final Widget? child;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: bgColor ?? ColorResources.getColor(),
            image: DecorationImage(image: AssetImage(themeController.imgBg), fit: BoxFit.cover),
          ),
          child: child,
        );
      }
    );
  }
}
