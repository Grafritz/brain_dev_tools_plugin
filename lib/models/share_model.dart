// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:brain_dev_tools/I10n/localization_constants.dart';
import 'package:brain_dev_tools/controllers/application_controller.dart';
import 'package:brain_dev_tools/dao/entities/properties/la_bible/plan_de_lecture/pdl_share_property.dart';
import 'package:brain_dev_tools/tools/constant.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:brain_dev_tools/tools/validation/clean_data.dart';
import 'package:brain_dev_tools/tools/validation/sanitizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:launch_app_store/launch_app_store.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class MyImageInfo{
  String body='';
  String imageBase64='';
  String linkWebPartial='';
  String codeLecture='';

  MyImageInfo({
    this.imageBase64='',
    this.linkWebPartial=''
  });


  Map<String, dynamic> convertToJson() => {
    PdlShareProperty.body.columnName: body,
    PdlShareProperty.imageBase64.columnName: '',//imageBase64,
    PdlShareProperty.linkWebPartial.columnName: linkWebPartial,
    PdlShareProperty.codeLecture.columnName: codeLecture,
  };
}

class ShareModel {
  Color? colorTop100;
  Color? colorBottom;
  bool? isHaveImage;
  bool? isImageOnline;
  String? pathImage;

  ShareModel(
      {this.colorTop100,
      this.colorBottom,
      this.isImageOnline,
      this.pathImage,
      this.isHaveImage});

  void fromMap(Map<String, dynamic> map) {
    colorTop100 = map['colorTop100'];
    colorBottom = map['colorBottom'];
    isImageOnline = map['isImageOnline'];
    pathImage = map['pathImage'];
    isHaveImage = map['isHaveImage'];
  }

  factory ShareModel.fromMap(Map<String, dynamic> data) => ShareModel(
      colorTop100: data['colorTop100'],
      colorBottom: data['colorBottom'],
      isImageOnline: data['isImageOnline'],
      pathImage: data['pathImage'],
      isHaveImage: data['isHaveImage']);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'colorTop100': colorTop100,
      'colorBottom': colorBottom,
      'isImageOnline': isImageOnline,
      'pathImage': pathImage,
      'isHaveImage': isHaveImage
    };
    return map;
  }

  //region [ Save Image ]
  Future<String> getShareImage(
      {required GlobalKey globalKey,
      String imageName = 'la_sainte_bible.png'}) async {
    Uint8List? uInt8List = await captureWidgetImage(globalKey: globalKey);
    return saveImageOnDevice(uInt8List: uInt8List, name: '$imageName.png');
  }

  Future<String> saveImage(
      {required GlobalKey globalKey, required String imageName}) async {
    return getShareImage(globalKey: globalKey, imageName: imageName);
  }

  Future<Uint8List?> captureWidgetImage({required GlobalKey globalKey}) async {
    try {
      RenderRepaintBoundary? boundary = globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;
      ui.Image? image = await boundary?.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image?.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? pngBytes = byteData?.buffer.asUint8List();
      return pngBytes!;
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'captureWidgetImage');
    }
    return null;
  }

  Future<String> saveImageOnDevice(
      {required Uint8List? uInt8List, required String name}) async {
    if (uInt8List != null) {
      final directory = Platform.isIOS
          ? await getApplicationDocumentsDirectory()
          : await getExternalStorageDirectory();
      final filePath = join(directory!.path, name);
      final file = await File(filePath).writeAsBytes(uInt8List);
      return file.path;
    }
    return '';
  }

  //endregion

//region [ Save Image ]
  shareImage({required GlobalKey globalKey, String? msg, String? nameImage}) async {
    try {
      //if( CheckPlatform().isMobile ) {
      String image = await getShareImage(globalKey: globalKey);
      final files = <XFile>[];
      files.add(XFile(image, name: 'la_sainte_bible_$nameImage'));
      String msg0 = '$msg';
      msg0 += '\n\n${Constant.appName}\n${Constant.urlAppCCGMobileOnly()}';
      Share.shareXFiles(files, text: msg0, subject: '${tr('label_Partager')}');
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'shareImage');
    }
  }

//endregion

//region [ Rate App ]
  static launchReviewApp() {
    String packageName = Get.find<ApplicationController>().packageInfo.packageName;
    LaunchReview.launch( androidAppId: packageName, iOSAppId: Constant.appStoreIdIdentifierCCG);
  }
//endregion

//region [ SHARE ]
  static shareApp() {
    Share.share('${Constant.appName}\n${Constant.urlAppMobileCCG()}',
        subject: tr('label_Partager'));
  }

  static shareTextCEWithLinkCCG(
      {required  ce, required int index}) async {
    // https://www.chant.rezo509.com/mobile/MobileChantViewDetails.aspx?ID=207&tc=FR&ri=3&IDG=12
    String linkWeb =
        '${Constant.urlWebSiteCCG}/mobile/MobileChantViewDetails.aspx?ID=${ce.noChant}&tc=${ce.typeChant}&ri=$index&IDG=${ce.groupeChantantId}';
    String msg = ce.titre; //\n\n${ce.audioPath}';
    String data = CleanData.UNCODE_UTF_8(CleanData.getTextFromHtml(
        CleanData.ReplaceHtmlBreakToSlashN(ce.contenu)));
    msg +=
        '\n\n${(data.length >= 150) ? '${data.substring(0, 150)}...' : data}';
    msg +=
        '\n\n$linkWeb \n\n${Constant.appName}\n${Constant.urlAppCCGMobileOnly()}';
    Share.share(msg, subject: 'label_Partager'.tr);
  }

  static shareLinkAppStoreCCG({bool is4Share = true}) async {
    Share.share(
        '${Constant.appName}\n${Constant.urlAppMobileCCG(is4Share: is4Share)}',
        subject: 'label_Partager'.tr);
  }

  static shareLinkAppStoreLSB({bool is4Share = true}) {
    Share.share(
        '${Constant.appName}\n${Constant.urlAppMobileLSB(is4Share: is4Share)}',
        subject: 'label_Partager'.tr);
  }

  String copyLyricShareText1({required chantUser}) {
    String msg =
        '${chantUser.position} - ${Sanitizer.UNCODE_UTF_8(chantUser.titre)}';
    msg += '\n${CleanData.ReplaceHtmlBreakToSlashN(chantUser.contenu)}';
    msg += '\n${CleanData.ReplaceHtmlBreakToSlashN(chantUser.auteurChant)}';
    //msg += '\n\n${Constant.urlAppMobileCCG()}';
    return msg;
  }

  static Future copyLyricShare(
      {required chantUser}) async {
    String data = copyLyricTextData(chantUser: chantUser);
    //msg += '${Constant.appName}\n\n';
    await Share.share(data, subject: 'label_Partager'.tr);
    //Clipboard.setData(ClipboardData( text: msg));
  }

  static String copyLyricTextData({required chantUser}) {
    String msg =
        '${chantUser.position} - ${Sanitizer.UNCODE_UTF_8(chantUser.titre)}';
    msg += '\n\n${CleanData.ReplaceHtmlBreakToSlashN(chantUser.contenu)}';
    msg += '\n${CleanData.ReplaceHtmlBreakToSlashN(chantUser.auteurChant)}';
    msg += '\n\n${Constant.urlAppMobileCCG()}';
    return msg;
  }
//endregion
}

List<ShareModel> shareImageList = [
  ShareModel(colorTop100: Colors.white, colorBottom: Colors.white,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.black, colorBottom: Colors.black,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.red[100], colorBottom: Colors.red,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.deepPurple[100], colorBottom: Colors.deepPurple,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.blue[100], colorBottom: Colors.blue,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.lightBlue[100], colorBottom: Colors.lightBlue,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.cyan[100], colorBottom: Colors.cyan,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.teal[100], colorBottom: Colors.teal,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.green[100], colorBottom: Colors.green,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.lightGreen[100], colorBottom: Colors.lightGreen,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.lime[100], colorBottom: Colors.lime,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.yellow[100], colorBottom: Colors.yellow,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.amber[100], colorBottom: Colors.amber,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.orange[100], colorBottom: Colors.orange,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.deepOrange[100], colorBottom: Colors.deepOrange,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.brown[100], colorBottom: Colors.brown,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.grey[100], colorBottom: Colors.grey,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
  ShareModel(colorTop100: Colors.blueGrey[100], colorBottom: Colors.blueGrey,
      isHaveImage: false, isImageOnline: false,
      pathImage: '' ),
];