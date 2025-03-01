import 'package:brain_dev_tools/tools/utils/image_icon_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'validation/type_safe_conversion.dart';

class VideoLinkModel {
  String linkName = '';
  String url = '';
  bool selected = false;

  IconData? get iconData {
    switch (linkName) {
      case 'facebook':
      case 'facebook.com':
        return Icons.facebook;
      case 'youtube':
      case 'youtube.com':
        return Icons.video_library_rounded;
      default:
    }
    return Icons.ondemand_video_sharp;
  }

  Widget get widgetIconData {
    return Icon(
      iconData,
      size: 90,
      color: Theme.of(Get.context!).primaryColor,
    );
  }

  Widget get widgetImage {
    return Image.asset(
      ImageIconResources.ic_video,
      width: 90,
      color: Theme.of(Get.context!).primaryColor,
    );
  }
}

class KeyValueModel {
  String key = '';
  String value = '';
  String desc = '';
  int valueInt = -1;
  String flag = '';
  bool selected = false;

  String get name => key;

  String get id => value;

  String get nameDefault => key;

  KeyValueModel({
    this.key = '',
    this.value = '',
    this.desc = '',
    this.flag = '',
    this.valueInt = -1,
    this.selected = false,
  });

  factory KeyValueModel.fromJsonCountResultatByFormCode(
      Map<String, dynamic> map) {
    return KeyValueModel(
      key : TypeSafeConversion.nullSafeString( map['formCode'] ),
      value : TypeSafeConversion.nullSafeString( map['nbrResultat'] ),
    );
  }
}
