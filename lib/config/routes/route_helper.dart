import 'package:brain_dev_tools/config/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteHelperTools
{

  static const String profilePage = '/profil';
  static getInformationScreen({ required String page }) => '${RouteNameTools.informationScreen}?${RouteNameTools.pageVar}=$page';

  static navProfileScreen({ required String userId }) =>
      Navigator.pushNamed(Get.context!, profilePage);

  static navInformationScreen({ required String page }) => Navigator.pushNamed(Get.context!, getInformationScreen(page: page));

}