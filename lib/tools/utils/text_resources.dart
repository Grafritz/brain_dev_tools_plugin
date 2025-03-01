import 'package:get/get.dart';

class TextResources {
  static String labelActiveModeSombreOrNot() => Get.isDarkMode
      ? 'label_Desactiver_mode_sombre'.tr
      : 'label_activer_mode_sombre'.tr;

  static String labelActiveNotificationOrNot(bool value) => value
      ? 'label_desactive_notification_plan'.tr
      : 'label_active_notification_plan'.tr;

  static String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
