import 'dart:io';

import 'package:get/get.dart';

class ApiChecker {
  /*
  static void checkApi(Response response) {
logCat('response.statusCode: ${response.statusCode}');
    if(response.statusCode == 401) {
      if(Get.currentRoute != RouteHelper.login_screen) {
        Get.find<AuthController>().removeCustomerToken();
        Get.offAllNamed(
          RouteHelper.getLoginRoute(
            countryCode: Get.find<AuthController>().getCustomerCountryCode(),
            phoneNumber: Get.find<AuthController>().getCustomerNumber(),
          ),
        );
        showCustomSnackBar(response.body['message'] ?? 'unauthorized'.tr, isIcon: true);
      }
    }
    else if(response.statusCode == 429) {
      showCustomSnackBar('to_money_login_attempts'.tr);

    } else if(response.statusCode == -1){
      Get.find<AuthController>().removeCustomerToken();
      Get.offAllNamed(RouteHelper.getLoginRoute(
        countryCode: Get.find<AuthController>().getCustomerCountryCode(),
        phoneNumber: Get.find<AuthController>().getCustomerNumber(),
      ));
      showCustomSnackBar('you are using vpn', isVpn: true, duration: const Duration(minutes: 10));
    }else {
      logCat('body1: ${response.body}');
      if( response.body!=null) {
        String body = TypeSafeConversion.nullSafeString( response.body['message']);
        logCat('body2: $body');
        showCustomSnackBar(body ?? ErrorBody.fromJson(response.body).errors?.first.message ?? '', isError: true);
      }else{
        showCustomSnackBar( 'Une erreur est survenue', isError: true);
      }
    }
  }
  */
  static Future<bool> isVpnActive() async {
    if (GetPlatform.isWeb) {
      return false;
    }
    bool isVpnActive;
    List<NetworkInterface> interfaces = await NetworkInterface.list(
        includeLoopback: false, type: InternetAddressType.any);
    interfaces.isNotEmpty
        ? isVpnActive = interfaces.any((interface) =>
            interface.name.contains("tun") ||
            interface.name.contains("ppp") ||
            interface.name.contains("pptp"))
        : isVpnActive = false;
    return isVpnActive;
  }
}
