import 'dart:async';
import 'package:brain_dev_tools/I10n/localization_constants.dart';
import 'package:brain_dev_tools/tools/constant.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:brain_dev_tools/tools/key_value_model.dart';
import 'package:brain_dev_tools/tools/utils/color_resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool isBrightnessDark = false;
String labelActiveModeSombreOrNot = '';
final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);
final iWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);

bool showCircularProgressIndicator = false;
String placeHolderMessageError = translator('msg_info_non_chargee_correctement');
String placeHolderMessageProgressIndicator='';
Timer? timer;

const TextStyle smallText = TextStyle( fontSize: 12.0 );
var titleTextStyle = const TextStyle(
  //color: Colors.blueGrey,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
var paddingButton = const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8);
var paddingListViewHome = const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 0);
var borderSideAppBar = const BorderSide(color: Colors.white,width: 1.0, style: BorderStyle.solid);

var borderSideAppBarDefaultColorApp = BorderSide(color: ColorResources.getColorAppOrYours(), width: 1.0, style: BorderStyle.solid);
var roundedBorderAppBar = RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

var outlinedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.white, shape: roundedBorderAppBar,
  side: borderSideAppBar,
);
var outlinedButtonStyleByApp = ElevatedButton.styleFrom(
  foregroundColor: Colors.white,
  shape: roundedBorderAppBar,
  side: borderSideAppBarDefaultColorApp,
);

var outlinedButtonStyle2 = ButtonStyle(
  shape: WidgetStateProperty.all(roundedBorderAppBar),
);

// titlePlandeLecture() => TextStyle( fontSize: 20, color: ColorResources.getColor( color: Theme.of(Get.context!).primaryColor)/*Theme.of(context).primaryColor*/);
// styleReward () => TextStyle(
// color: ColorResources.getColor( color: Theme.of(Get.context!).primaryColorDark),
//   fontWeight: FontWeight.w500,fontSize: 12,/*decoration: TextDecoration.underline*/ );

var titleTextStylePlandeLecture = const TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
);

var titleTextTopStylePlandeLecture = const TextStyle(
  color: Colors.white,
  fontSize: 12.0,
);

backElevatedButtonStyleFrom(BuildContext context ) =>  ElevatedButton.styleFrom(
  foregroundColor: Theme.of(Get.context!).primaryColorDark, backgroundColor: Theme.of(Get.context!).primaryColorLight, padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      bottomLeft: Radius.circular(30),
    ),
  ),
);

backElevatedButtonNormal(BuildContext context, { Color? color, Color? textColor } ) =>  ElevatedButton.styleFrom(
  foregroundColor: (textColor==null)? Theme.of(Get.context!).primaryColorDark :textColor, backgroundColor: (color==null)?Theme.of(Get.context!).primaryColorLight:color, padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
);
nextElevatedButtonStyleFrom(BuildContext context, { Color? color, Color? textColor } ) =>  ElevatedButton.styleFrom(
  foregroundColor: (textColor==null)?Colors.white:textColor, backgroundColor: (color==null)?Theme.of(context).primaryColor:color, padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ),
  ),
);
nextElevatedButtonNormal(BuildContext context, { Color? color, Color? textColor } ) =>  ElevatedButton.styleFrom(
  foregroundColor: (textColor==null)?Colors.white:textColor, backgroundColor: (color==null)?Theme.of(context).primaryColor:color, padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
);


String getUid="";
String getDisplayName="";
String getId = "";
String getIdToken = "";
String getEmail = "", message="";
String getPhotoUrl='';

//region [  ]
// signInWithEmailAndPassword
// ignore: non_constant_identifier_names
String ERROR_INVALID_EMAIL = 'ERROR_INVALID_EMAIL';
// ignore: non_constant_identifier_names
String ERROR_WRONG_PASSWORD = 'ERROR_WRONG_PASSWORD';
// ignore: non_constant_identifier_names
String ERROR_USER_NOT_FOUND = 'ERROR_USER_NOT_FOUND';
// ignore: non_constant_identifier_names
String ERROR_USER_DISABLED = 'ERROR_USER_DISABLED';
// ignore: non_constant_identifier_names
String ERROR_TOO_MANY_REQUESTS = 'ERROR_TOO_MANY_REQUESTS';
// ignore: non_constant_identifier_names
String ERROR_OPERATION_NOT_ALLOWED = 'ERROR_OPERATION_NOT_ALLOWED';

// createUserWithEmailAndPassword
//String ERROR_INVALID_EMAIL = 'ERROR_INVALID_EMAIL';
// ignore: non_constant_identifier_names
String ERROR_WEAK_PASSWORD = 'ERROR_WEAK_PASSWORD';
// ignore: non_constant_identifier_names
String ERROR_EMAIL_ALREADY_IN_USE = 'ERROR_EMAIL_ALREADY_IN_USE';
//endregion

String getSigleName({ required String nomComplet }){
  String result='';
  var nomCom = nomComplet.trim().split(' ');
  if( nomCom.isNotEmpty ) {
    for (int i = 0; i < nomCom.length; i++) {
      if( nomCom[i].length>=3){
        result +=nomCom[i].substring(0,1).toUpperCase();
      }
    }
  }else if( nomComplet.length == 1 ){
    result = nomComplet.substring(0,2).toUpperCase();
  }else{
    result = 'LSB';
  }
  return result.toUpperCase();
}
const String modulePlDL = 'PlDL';
const String modulePlDLUser = 'PlDLUser';
const String modulePrDL = 'PrDL';
const String moduleStQR = 'StQR';
const String moduleFrQR = 'FrQR';
const String moduleNote = 'Note';
const String moduleBookmark = 'Bookmark';

//region [ Route ]
const String adminQuestionsBible='/adminQuestionsBible';
const String adminPdlCategory='/adminPdlCategory';
const String adminPdlPlandelecture='/adminPdlPlandelecture';
const String adminUserAccount='/adminUserAccount';
const String adminLicenceUser='/adminLicenceUser';

List<String> pageNameMenuDrawerList =[
  adminQuestionsBible,
  adminPdlCategory,
  adminPdlPlandelecture,
  adminUserAccount,
];
//endregion

List<KeyValueModel> typeQuestionList = [
  KeyValueModel(key: 'label_choixUniqueRadio', valueInt: Constant.choixUniqueRadio),
  KeyValueModel(key: 'label_choixUniqueCombo', valueInt: Constant.choixUniqueCombo),
  KeyValueModel(key: 'label_choixMultipleCheckBox', valueInt: Constant.choixMultipleCheckBox),
  //new KeyValueModel(key: 'label_saisieAlphaOnly', valueInt: Constant.saisieAlphaOnly),
  //new KeyValueModel(key: 'label_saisieNumericOnly', valueInt: Constant.saisieNumericOnly),
  //new KeyValueModel(key: 'label_saisieAlphaNumeric', valueInt: Constant.saisieAlphaNumeric),
];

getIconTypeQuestion(String key){
  if( key=='label_choixUniqueRadio'){
    return const Icon(FontAwesomeIcons.listUl);
  }else if( key=='label_choixUniqueCombo'){
    return const Icon(FontAwesomeIcons.rectangleList);
  }else if( key=='label_choixMultipleCheckBox'){
    return const Icon(FontAwesomeIcons.listCheck);
  }else if( key=='label_saisieAlphaOnly'){
    return const Icon(FontAwesomeIcons.arrowDownAZ);
  }else if( key=='label_saisieNumericOnly'){
    return const Icon(FontAwesomeIcons.arrowDown19);
  }else if( key=='label_saisieAlphaNumeric'){
    return const Icon(FontAwesomeIcons.spellCheck);
  }
}
TypeRecherche getTypeRecherche(int key){
  if( key == TypeRecherche.inAllBible.index ){
    return TypeRecherche.inAllBible;
  }else if( key == TypeRecherche.inBookChoice.index ){
    return TypeRecherche.inBookChoice;
  }else if( key == TypeRecherche.oldTestament.index ){
    return TypeRecherche.oldTestament;
  }else if( key == TypeRecherche.newTestament.index ){
    return TypeRecherche.newTestament;
  }
  return TypeRecherche.inAllBible;
}
String getTypeRechercheStr(int key) {
  if( key == TypeRecherche.inAllBible.index ){
    return tr('label_inAllBible');
  }else if( key == TypeRecherche.inBookChoice.index ){
    return tr('label_inBookChoice');
  }else if( key == TypeRecherche.oldTestament.index ){
    return tr('label_oldTestament');
  }else if( key == TypeRecherche.newTestament.index ){
    return tr('label_newTestament');
  }
  return tr('label_inAllBible');
}

//endregion