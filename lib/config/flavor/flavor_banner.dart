
import 'package:brain_dev_tools/config/api/api_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

Widget myFlavorBanner({required Widget child, bool showBanner = true}) {
  if (FlavorConfig.instance.name != ApiVariables.PROD) {
    return FlavorBanner(child: child);
  }
  return child;
}