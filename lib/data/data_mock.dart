
import 'package:brain_dev_tools/models/language_model.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:brain_dev_tools/tools/key_value_model.dart';
import 'package:get/get.dart';

class DataUse {
  static List<KeyValueModel> statusPublishList1 = [
    KeyValueModel(
        key: "label_visible_anyone".tr,
        value: EnumStatusPublish.public.index.toString(),
        valueInt: EnumStatusPublish.public.index,
        flag: "🌐"),
    KeyValueModel(
        key: "label_visible_only_me".tr,
        value: EnumStatusPublish.private.index.toString(),
        valueInt: EnumStatusPublish.private.index,
        flag: "🔐"),
  ];
  static List<LangueModel> statusPublishList = [
    LangueModel(
        name: "label_visible_anyone".tr,
        value: EnumStatusPublish.public.index.toString(),
        flag: "🌐"),
    LangueModel(
        name: "label_visible_only_me".tr,
        value: EnumStatusPublish.private.index.toString(),
        flag: "🔐"),
  ];
}
