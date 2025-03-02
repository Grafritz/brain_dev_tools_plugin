import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_resources.dart';

var titre = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

var sTitre = TextStyle(
  fontFamily: 'Brandon',
  fontSize: 10,
  fontStyle: FontStyle.italic,
  color: Colors.black,//.withOpacity(0.7),
);
var titlePlandeLecture = TextStyle(
    fontSize: 20,
    color: ColorResources.getColor(color: Theme.of(Get.context!).primaryColor));

var styleReward = TextStyle(
  color:
      ColorResources.getColor(color: Theme.of(Get.context!).primaryColorDark),
  fontWeight: FontWeight.w500,
  fontSize: 12, /*decoration: TextDecoration.underline*/
);

const buttonStyle = TextStyle(fontFamily: 'Brandon');

const rubikLight = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w300,
);

const rubikRegular = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
);

const rubikMedium = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
);

const rubikSemiBold = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w600,
);

var textStyleTitleHomeCardView = const TextStyle(
  color: Colors.black87,
  fontSize: 15.0,
  fontWeight: FontWeight.w500,
);
var titleSliderTextStyle = const TextStyle(
  color: Colors.white,
  fontSize: 15.0,
  fontWeight: FontWeight.w400,
);
var homeTitleTextStyle = const TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    fontFamily: 'Poppins');

var viewAllStyle = GoogleFonts.roboto(
  textStyle: const TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.normal,
    fontSize: 13,
  ),
);

var paddingHorizontal =
    const EdgeInsets.only(left: 5.0, right: 5.0, top: 5, bottom: 5);
var colorHorizontal = ColorResources.getColor();