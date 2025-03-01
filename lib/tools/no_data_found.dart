import 'package:brain_dev_tools/controllers/connectivity_controller.dart';
import 'package:brain_dev_tools/tools/my_elevated_button.dart';
import 'package:brain_dev_tools/tools/utils/image_icon_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoDataFound extends StatefulWidget {
  const NoDataFound({
    super.key,
    this.isScaffold = false,
    //this.isNoInternet=false,
    this.messageError = '',
    this.textButton = '',
    this.showTextButton = false,
    this.widgetTop,
    this.widgetAfter,
    this.onPressed,
  });

  final String messageError, textButton;
  final bool isScaffold, showTextButton;
  final Widget? widgetTop, widgetAfter;
  final VoidCallback? onPressed;

  @override
  State<NoDataFound> createState() => _NoDataFoundState();
}

class _NoDataFoundState extends State<NoDataFound> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    await Get.find<ConnectivityController>().checkWifi();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isScaffold) {
      return Scaffold(
        appBar: AppBar(title: Text("msg_title_Attention".tr)),
        body: noDataInfo(context),
      );
    }
    return noDataInfo(context);
  }

  noDataInfo(context) {
    return GetBuilder<ConnectivityController>(builder: (connectivityCtr) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.widgetTop != null)
              Container(
                child: widget.widgetTop,
              ),
            Image.asset(
              (!connectivityCtr.isInternetOk)
                  ? ImageIconResources.assetsNoInternetPath
                  : ImageIconResources.assetsNoRecordFoundPath,
              width: 190,
            ),
            if (!connectivityCtr.isInternetOk)
              Text(
                'msg_No_Internet_connection'.tr,
                textAlign: TextAlign.center,
              ),
            if (!connectivityCtr.isInternetOk)
              SizedBox(height: 10),
            Text(
              widget.messageError,
              textAlign: TextAlign.center,
            ),
            if (widget.widgetAfter != null)
              Container(
                child: widget.widgetAfter,
              ),
            if (widget.showTextButton)
              TextButton.icon(
                style: elevatedButtonNormal(
                    backgroundColor: Theme.of(context).primaryColorLight),
                icon: const Icon(Icons.refresh),
                label: Text(widget.textButton.isNotEmpty
                    ? widget.textButton
                    : 'label_Reload'.tr),
                onPressed: widget.onPressed,
              ),
          ],
        ),
      );
    });
  }
}

class NoDataFound1 extends StatelessWidget {
  final String messageError;
  final bool isNoInternet;
  final bool showTextButton;
  final VoidCallback? onPressed;

  const NoDataFound1(
      {super.key,
      this.isNoInternet = false,
      this.messageError = '',
      this.showTextButton = false,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset( (isNoInternet)? ImageIconResources.assetsNoInternetPath: ImageIconResources.assetsNoRecordFoundPath, width: 300, ),
            Text( messageError ),
            if( showTextButton )
            TextButton.icon(
              style: elevatedButtonNormal(backgroundColor: Theme.of(context).primaryColorLight),
                icon: const Icon(Icons.refresh),
                label: Text('${'label_Reload'.tr} '),
                onPressed: onPressed,
              ),
          ],
        ),
      ),
    );
  }
}
