// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  static const double IMAGE_PROFIL_WIDTH = 40.0;
  static const double IMAGE_PROFIL_BIG1_WIDTH = 80.0;
  static const double IMAGE_PROFIL_BIG_WIDTH = 85.0;
  static const double TAB_HOME_ICON_WIDTH = 25.0;
  static const double TAB_RECIPE_DETAIL_ICON_WIDTH = 25.0;

  static const double FONT_SIZE_EXTRA_SMALL = 8.0;
  static const double FONT_SIZE_SMALL = 10.0;
  static const double FONT_SIZE_DEFAULT = 13.0;
  static const double FONT_SIZE_LARGE = 16.0;
  static const double FONT_SIZE_EXTRA_LARGE = 20.0;
  static const double FONT_SIZE_OVER_LARGE = 20.0;
  static const double FONT_SIZE_EXTRA_OVER_LARGE = 22.0;
  static const double FONT_SIZE_OVER_OVER_LARGE = 28.0;

  static const double PADDING_SIZE_SUPER_EXTRA_SMALL = 2.0;
  static const double PADDING_SIZE_EXTRA_SMALL = 5.0;
  static const double PADDING_SIZE_SMALL = 10.0;
  static const double PADDING_SIZE_DEFAULT = 16.0;
  static const double PADDING_SIZE_LARGE = 20.0;
  static const double PADDING_SIZE_EXTRA_LARGE = 25.0;
  static const double PADDING_SIZE_EXTRA_EXTRA_LARGE = 32.0;
  static const double PADDING_SIZE_OVER_LARGE = 45.0;
  static const double PADDING_SIZE_EXTRA_OVER_LARGE = 55.0;

  static const double RADIUS_SIZE_VERY_SMALL = 4.0;
  static const double RADIUS_SIZE_EXTRA_SMALL = 8.0;
  static const double RADIUS_SIZE_SMALL = 12.0;
  static const double RADIUS_SIZE_REGULAR = 14.0;
  static const double RADIUS_SIZE_DEFAULT = 16.0;
  static const double RADIUS_SIZE_LARGE = 20.0;
  static const double RADIUS_SIZE_EXTRA_LARGE = 30.0;
  static const double RADIUS_SIZE_EXTRA_EXTRA_LARGE = 40.0;
  static const double RADIUS_SIZE_OVER_LARGE = 50.0;
  static const double RADIUS_PROFILE_AVATAR = 25.0;
  static const double SIZE_PROFILE_AVATAR = 50.0;

  static const double RADIUS_SIZE_EXTRA_SMALL_ = 4.0;

  static const double DIVIDER_SIZE_SMALL = 1.0;
  static const double DIVIDER_SIZE_EXTRA_SMALL = 0.5;
  static const double DIVIDER_SIZE_MEDIUM = 2.0;
  static const double DIVIDER_SIZE_LARGE = 4.0;
  static const double DIVIDER_SIZE_EXTRA_LARGE = 4.0;

  static const double APPBAR_HIGHT_SIZE = 70.0;

  static const double SMALL_LOGO = 50.0;
  static const double BIG_LOGO = 70.0;
  static const double MEDIUM_LOGO = 50.0;

  static const double BOTTOM_PERSIST_HEIGHT = 50.0;
  static const double SPACE_FROM_BOTTOM = 80.0;

  static const double CONTACT_TILE_LEFT_PADDING = 65.0;
  static const double CONTACT_TILE_RIGHT_PADDING = 35.0;

  static const double SEARCH_ICON_WIDTH = 19.0;
  static const double SUCCESS_ANIMATION_WIDTH = 120.0;
  static const double FAILED_ANIMATION_WIDTH = 80.0;

  static const double ADD_MONEY_CARD = 80.0;
  static const double ADD_MONEY_CARD_CONTAINER = 80.0;
  static const double SCREENSHOT_ICON_SIZE = 100.0;

  static const double THIRD_CARD_HEIGHT = 225.0;
  static const double TRANSACTION_CARD_HEIGHT = 37.0;
  static const double TRANSACTION_CARD_WEIGHT = 37.0;

  static const double MAIN_BACKGROUND_CARD_WEIGHT = 180.0;
  static const double ADD_MONEY_CARD_HEIGHT = 90.0;
  static const double TRANSACTION_TYPE_CARD_HEIGHT = 120.0;

  static const double ARROW_ICON_SIZE = 12.0;
  static const double PROFILE_PAGE_ICON_SIZE = 28.0;

  static const double NAVBAR_ICON_SIZE = 20.0;
  static const double NAVBAR_FONT_SIZE = 10.0;

  static const double NOTIFICATION_IMAGE_SIZE = 64.0;

  static double getSize() {
    Orientation orientation = MediaQuery.of(Get.context!).orientation;
    var size = MediaQuery.of(Get.context!).size;
    double dim = (orientation == Orientation.portrait)
        ? size.height / 4
        : size.width / 4.5;
    if (orientation == Orientation.portrait) {
      dim = size.height / 4;
      if (size.width < 600) {
        dim = size.height / 4.4;
      } else {
        // is Tablette
        dim = size.height / 5.4;
      }
    } else if (orientation == Orientation.landscape) {
      dim = size.width / 4.5;
      if (size.height >= 400 && size.height <= 500) {
        dim = size.width / 4.5;
      } else if (size.height > 500) {
        dim = size.width / 4.3;
      }
    }
    return dim;
  }
}
