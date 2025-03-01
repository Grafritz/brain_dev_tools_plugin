// import 'package:brain_dev_tools/tools/check_platform.dart';
// import 'package:brain_dev_tools/tools/constant.dart';
// import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:in_app_review/in_app_review.dart';

class InAppReviewToolsController  extends GetxController implements GetxService
{
  //region [ ATTRIBUTS ]
  // final InAppReview inAppReview = InAppReview.instance;
  // String appStoreId = Constant.appStoreIdIdentifierCCG;
  // String microsoftStoreId = '';

  // Availability _availability = Availability.loading;
  // Availability get availability => _availability;
  //endregion

  InAppReviewToolsController(){
    initState();
  }

  //region [ ]
  void initState() {
    (<T>(T? o) => o!)(WidgetsBinding.instance).addPostFrameCallback((_) async
    {
      try {
        // final isAvailable = await inAppReview.isAvailable();

        // This plugin cannot be tested on Android by installing your app
        // locally. See https://github.com/britannio/in_app_review#testing for
        // more information.
        // _availability = isAvailable && !checkPlatform.isAndroid
        //     ? Availability.available
        //     : Availability.unavailable;
      } catch (_) {
        // _availability = Availability.unavailable;
      }
      update();
    });
  }
  //endregion

//region [ ]
//   Future<void> requestReview() => inAppReview.requestReview();
//
//   Future<void> openStoreListing() => inAppReview.openStoreListing(
//     appStoreId: appStoreId,
//     microsoftStoreId: microsoftStoreId,
//   );
//endregion

//region [ ]
//endregion
}