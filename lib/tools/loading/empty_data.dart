
import 'package:brain_dev_tools/tools/utils/image_icon_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyData extends StatefulWidget {
  final String placeHolderMessage;
  final bool isNoInternet;

  const EmptyData(
      {super.key, this.placeHolderMessage = '', this.isNoInternet = false});

  @override
  State<EmptyData> createState() => _EmptyDataState();
}

class _EmptyDataState extends State<EmptyData> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            (widget.isNoInternet)
                ? ImageIconResources.assetsNoInternetPath
                : ImageIconResources.assetsNoRecordFoundPath,
            width: 300,
          ),
          //Text(_placeHolderMessageError ),
          //new Icon(Icons.info_outline, size: 35, color: Colors.grey, ),
          Text(
            (widget.placeHolderMessage != "")
                ? widget.placeHolderMessage
                : 'placeholder_dataEmptymessage'.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
