import 'dart:convert';

import 'package:brain_dev_tools/views/base/shimmer_widget.dart';
import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/dialog_view.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:brain_dev_tools/tools/utils/image_icon_resources.dart';
import 'package:brain_dev_tools/tools/validation/validator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;
  final BoxShape? boxShape;
  final String placeholder;

  const CustomImage(
      {super.key,
      required this.imageUrl,
      this.height = 0,
      this.width = 0,
      this.fit = BoxFit.cover,
      this.placeholder = '',
      this.boxShape});

  @override
  Widget build(BuildContext context) {
    bool isURl = isUrl(imageUrl);
    if( isURl ){
      if (checkPlatform.isWeb) {
        return Image.network(imageUrl, width: width, height: height, fit: BoxFit.cover);
      }
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Image.asset(
            placeholder.isEmpty ? ImageIconResources.placeholder : placeholder,
            width: width,
            height: height,
            fit: BoxFit.cover),
        //const Icon(Icons.error),
        placeholder: (context, url) => ShimmerWidget(
          width: width,
          height: height,
          circular: false,
        ),
        imageBuilder: boxShape == null
            ? null
            : (context, imageProvider)
        {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: boxShape!,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          );
        },
      );
    }
    bool base64 = isBase64(imageUrl);
    if (base64) {
      return Image.memory(base64Decode(imageUrl), width: width,
          height: height, fit: BoxFit.cover);
    }

    if(imageUrl.contains('assets/')){
      return Image.asset(imageUrl, width: width, height: height, fit: BoxFit.cover);
    }
    return Image.asset(placeholder.isEmpty ? ImageIconResources.placeholder : placeholder, width: width, height: height, fit: BoxFit.cover);
  }
}

String getSigleName(String nomComplet) {
  String result = '';
  var nomCom = nomComplet.trim().split(' ');
  if (nomCom.isEmpty) {
    return 'CCG';
  }

  if (nomCom.isNotEmpty) {
    for (int i = 0; i < nomCom.length; i++) {
      if (nomCom[i].length >= 3) {
        result += nomCom[i].substring(0, 1).toUpperCase();
      }
    }
  } else if (nomComplet.length == 1) {
    result = nomComplet.substring(0, 2).toUpperCase();
  }
  return result.toUpperCase();
}

getBannerIPOle(String pathUri, {double? width}) {
  bool isUl = isUrl(pathUri);
  if (isUl) {
    return CachedNetworkImageProvider(pathUri);
  } else {
    if (pathUri != '') {
      return MemoryImage(base64Decode(pathUri));
    }
  }
  return Image.asset(ImageIconResources.placeholder, width: width, fit: BoxFit.cover);
}

getBannerIP(String bannerPath, {Uint8List? bannerByte, double? width, double? height}) {
  try {
    if (bannerByte!=null) {
      return MemoryImage(bannerByte);
    }
    if( bannerPath.isNotEmpty) {
      bool link = isUrl(bannerPath);
      if (link) {
        return CachedNetworkImageProvider(bannerPath);
      }
      bool base64 = isBase64(bannerPath);
      if (base64) {
        return MemoryImage(base64Decode(bannerPath));
      }
    }
  } catch (ex, trace) {
    DialogView.showToast('msg_TraitementImpossible'.tr);
    logError(ex, trace: trace, position: 'openFileImageExplorer');
  }
  return Image.asset(ImageIconResources.placeholder, width: width, height: height, fit: BoxFit.cover);
}
Future showFileImage(pathUri) async {
  await showImageViewer(
    Get.context!,
    getBannerIP(pathUri),
    swipeDismissible: true,
    doubleTapZoomable: true,
  );
}
