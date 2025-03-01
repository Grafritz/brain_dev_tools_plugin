// ignore_for_file: constant_identifier_names, prefer_typing_uninitialized_variables, unnecessary_library_name, non_constant_identifier_names
library constants;

import 'package:brain_dev_tools/config/app_config.dart';
import 'package:brain_dev_tools/controllers/application_controller.dart';
import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Constant {
  int id;
  String title;
  String titleWithOutBreak;
  String imagePath;
  var colorData;

  static List<String>? imageExtensionsAllowed = [
    'jpg',
    'jpeg',
    'png',
    'bmp',
    'gif'
  ];
  static List<String>? audioExtensionsAllowed = [
    '3gp',
    'mp3',
    'aac',
    'm4a',
    'amr',
    'flac'
  ];
  static List<String>? solfegeExtensionsAllowed = [
    'jpg',
    'jpeg',
    'png',
    'bmp',
    'gif',
    'pdf'
  ];

  static String appName = EnvironmentVariable.appName;
  static String copyRightAppName = EnvironmentVariable.appName;

  static const String slashAppFlutter = "/app_flutter";
  //region [ LA BIBLE ]

  static const String quizClick = "quizClick";
  static const String pdlClick = "pdlClick";
  static const int gotoPreviews=1;
  static const int gotoNext=2;
  static const int verseBegin=1;
  static const int verseEnd=2;

  static const int intNew=1;
  static const int stringNew=2;
  static const int doubleNew=3;

  static const int optionsFont=3;

  static const String packagesNameBrain_dev_bible_app = 'packages/brain_dev_bible_app';
  static const String packagesNameBrain_dev_tools = 'packages/brain_dev_tools';
  static const String assetsDbsPath = '$packagesNameBrain_dev_bible_app/assets/dbs/';
  static const String assetsBiblePath = '$packagesNameBrain_dev_bible_app/assets/img/bible/';
  static const String logolaSainteBible ='$packagesNameBrain_dev_tools/assets/img/logo_la_sainte_bible_round.png';
  static const String dataBaseName = "LaSainteBible.db";
  static const String defaultDbNameBible = lsgDbName;//hcvDbName;//
  static const String hcvDbName = "hcv.db";
  static const String hcbDbName = "hcb.db";

  static const String lsgDbName = "lsg.db";
  static const String lsg2DbName = "fr_lsg2.db";
  static const String bpvDbName = "bpv.db";
  static const String bdsDbName = "bds.db";
  static const String frc97DbName = "frc97.db";
  static const String dbyDbName = "fr_dby.db";
  static const String ostrDbName = "fr_ostr.db";
  static const String dmbDbName = "fr_dmb.db";

  static const String kjvDbName = "kjv.db";
  static const String nkjvDbName = "en_nkjv.db";
  static const String kjv1611DbName = "en_kjv1611.db";
  static const String asv14DbName = "en_asv14.db";
  static const String icbDbName = "en_icb.db";
  static const String nirvDbName = "en_nirv.db";

  static const String btxDbName = "es_btx.db";
  static const String jlxxDbName = "es_jlxx.db";
  static const String rv65DbName = "es_rv65.db";
  //endregion

  static List<String> extensionsPdf = ['.pdf', 'pdf'];

  static const String closeAfter = 'closeAfter';
  static const String GS_DEV = 'GS_DEV';
  static const int Chant_Internaute_23 = 23;

  static const String GUID_EMPTY = '00000000-0000-0000-0000-000000000000';
  static String initialVideoId = "_oZ0oBBaZu8";
  static String initialVideoLinkCCG =
      "https://www.youtube.com/watch?v=_oZ0oBBaZu8";

  static const String channel_notification_song_share =
      'channel notification song share';

  static String copyright() =>
      '©2015-${DateTime.now().year} Develop by JFDUVERS';
  static const String USER_CONNECTED = "UserConnected20Sept2024";
  static const String DEVICE_ID = "DEVICE_ID";
  static const String TOKEN = "TOKEN";
  static const String API_TOKEN = "API_TOKEN_20241206";
  static const String API_TOKEN_EXPIRATION_DATE = "API_TOKEN_EXPIRATION_DATE";
  static String ALL = "ALL";
  static String USERS = "USERS";

  static String LANGUAGE_CODE = "LANGUAGE_CODE";
  static String COUNTRY_CODE = "COUNTRY_CODE";
  static String ASK_BC_FAVORIS = "ASK_BC3_FAVORIS";
  static String textAlign = "AlignmentPosition";
  static String textSize = "TextSize";
  static const String gotoPreviewsStr = "gotoPreviews";
  static const String gotoNextStr = "gotoNext";

  static String format_EEEEddMMMyyyy_space = "EEEE dd MMM yyyy";
  static DateFormat format_yyyyMMdd = DateFormat("yyyyMMdd");
  static DateFormat formatToSave_dd_MM_yyyy = DateFormat("dd-MM-yyyy");

  static const String privacy_policy = 'nav_PrivacyPolicy';
  static const String terms_and_conditions = 'terms_and_conditions';


  //region type questions
  static const int choixUniqueRadio = 1;
  static const int choixUniqueCombo = 2;
  static const int choixMultipleCheckBox = 3;
  static const int saisieAlphaOnly = 4;
  static const int saisieNumericOnly = 5;
  static const int saisieAlphaNumeric = 6;
  //endregion

  Constant({
    this.id = 0,
    this.title = '',
    this.titleWithOutBreak = '',
    this.imagePath = '',
    this.colorData,
  });

  static const int oui = 1;
  static const int non = 0;
  static const int chant_Chorale_et_Groupe_APP_Abonne_05 = 5;

//region [ LINK ]
  static String urlWebSiteRezo509 = "http://www.rezo509.com/";
  static String urlWebSiteCCG = "https://www.chant.rezo509.com";
  static String urlWebSiteLaBible = "https://labible.rezo509.com/";
  static String urlWebSiteBrainDev = "http://www.brain-dev.net";
  static String urlWebSiteChantCCG = "$urlWebSiteCCG/mobile/Frm_GroupeLivreChant.aspx";
  // static String urlGoogleStoreCCG = "https://play.google.com/store/apps/details?id=net.eebv.choralecentraleeebv";
  // static String urlAppleStoreCCG = "https://apps.apple.com/app/chant-chorale-et-groupe/id6443429478";


  static const String packageChantChoraleEtGroupe = "net.eebv.choralecentraleeebv";
  static String get appStoreIdentifierCCG
  {
    switch (EnvironmentVariable.environmentType) {
      case EnumEnvironmentType.chantchoraleetgroupe:
        return '/chant-chorale-et-groupe/id6443429478';
      case EnumEnvironmentType.chantdesperance:
        return "/chant-déspérance-lyrics/id6475238090";
      case EnumEnvironmentType.chantdesperancelegacy:
        return "/chant-déspérance-legacy/id6740459310";
      case EnumEnvironmentType.lyricevangelique:
        return '/lyric-evangelique/id6737840825';
      case EnumEnvironmentType.chantlyric:
        return '/chant-lyric/id6737840853';
      default:
        return '/chant-chorale-et-groupe/id6443429478';
    }
    //return "/chant-chorale-et-groupe/id6443429478";
  }
  static String get appStoreIdIdentifierCCG
  {
    switch (EnvironmentVariable.environmentType) {
      case EnumEnvironmentType.chantchoraleetgroupe:
        return '6443429478';
      case EnumEnvironmentType.chantdesperance:
        return "6475238090";
      case EnumEnvironmentType.chantdesperancelegacy:
        return "6740459310";
      case EnumEnvironmentType.lyricevangelique:
        return '6737840825';
      case EnumEnvironmentType.chantlyric:
        return '6737840853';
      default:
        return '6443429478';
    }
  }

  static String get urlGoogleStoreCCG {
    String packageName = Get.find<ApplicationController>().packageInfo.packageName;
    return "https://play.google.com/store/apps/details?id=$packageName";
  }

  static String urlAppleStoreCCG = "https://apps.apple.com/app$appStoreIdentifierCCG";
  static String urlAppleOrGoogleStoreCCG() => checkPlatform.isApple ? urlAppleStoreCCG : urlGoogleStoreCCG;

  static String urlWebSiteLSB = "https://labible.grafritz.com";
  static const String packageLaSainteBible = "net.braindev.lasaintebible";
  static String appStoreIdentifierLSB = "6443611963";
  static String urlGoogleStoreLSB = "https://play.google.com/store/apps/details?id=$packageLaSainteBible";
  static String urlAppleStoreLSB = "https://apps.apple.com/app/la-sainte-bible-multilangue/id$appStoreIdentifierLSB";
  static String urlAppleOrGoogleStoreLSB() => checkPlatform.isApple ? urlAppleStoreLSB : urlGoogleStoreLSB;

  static String packageChurchManagerMobile = "net.braindev.churchmanagermobile";

  static const String packageChantChoraleEtGroupeAndroid = packageChantChoraleEtGroupe;
  static const String packageChantChoraleEtGroupeIos = 'net.braindev.chantchoraleetgroupe';

  static const String packageChantdesperanceAndroid='net.braindev.chantdesperance';
  static const String packageChantdesperanceIos = packageChantdesperanceAndroid;

  static const String packageLyricevangeliqueAndroid='net.braindev.lyric.evangelique';
  static const String packageLyricevangeliqueIos=packageLyricevangeliqueAndroid;

  static const String packageChantlyricAndroid='net.braindev.lyrics';
  static const String packageChantlyricIos=packageChantlyricAndroid;

  static const String urlGooglePlayLinkAppRezo509WP =
      "https://play.google.com/store/apps/details?id=com.rezo509.wpmobile";

  static String urlPrivacyPolicyLaSainteBible = "${urlWebSiteLaBible}privacy-policy.html";


  static String urlPrivacyPolicyCCG = "$urlWebSiteCCG/privacy-policy.html";
  static String urlMyAccountGooglePersonalInfo = "https://myaccount.google.com/personal-info";

  static String urlChantDefault = "$urlWebSiteCCG/net_eebv_choralecentraleeebv/test_audio_vide.m4a";

  // static String urlAppleOrGoogleStoreLSB() {
  //   switch (defaultTargetPlatform) {
  //     case TargetPlatform.android:
  //       return urlGoogleStoreLSB;
  //     case TargetPlatform.iOS:
  //       return urlAppleStoreLSB;
  //     default:
  //       return urlWebSiteLaBible; //urlGoogleStoreLSB;
  //   }
  // }

//region [  ]
  static String urlAppMobileLSB({bool is4Share = true}) {
    var url = '\nAndroid : $urlGoogleStoreLSB';
    url += '\niOS : $urlAppleStoreLSB';
    url += '\nWeb : $urlWebSiteLSB';
    if (is4Share) {
      return url;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return urlGoogleStoreLSB;
      case TargetPlatform.iOS:
        return urlAppleStoreLSB;
      default:
        return urlGoogleStoreLSB;
    }
  }

  static String urlAppMobileCCG({bool is4Share = true}) {
    var url = '\nAndroid :$urlGoogleStoreCCG';
    url += '\n\niOS :$urlAppleStoreCCG';
    url += '\n\nWeb :$urlWebSiteCCG';
    if (is4Share) {
      return url;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return urlGoogleStoreCCG;
      case TargetPlatform.iOS:
        return urlAppleStoreCCG;
      default:
        return url;
    }
  }

  static String urlAppCCGMobileOnly() {
    var url = '\nAndroid :$urlGoogleStoreCCG';
    url += '\n\niOS :$urlAppleStoreCCG';
    //url += '\n\nWeb :' + urlWebSiteCCG;
    return url;
  }

  //endregion
//endregion

//region [ Assets Path ]
  static const String assetsPath = 'assets/';
  //region [ Assets Path | JSON Chant ]
  static String assets_chant_json = "assets/chant.json/";
  static String DATA_JSON_SECTION_CHANT = "${assets_chant_json}data_json_section_chant.json";
  static String data_groupe_chantant_json = "data_groupe_chantant.json";

  static String data_chant_04_choeur_dadoration =
      "data_chant_04_choeur_dadoration.json";
  static String data_chant_05_chorale_centrale_eebv =
      "data_chant_05_chorale_centrale_eebv.json";
  static String data_chant_06_chorale_sichem_eebv =
      "data_chant_06_chorale_sichem_eebv.json";

  //static String data_chant_07_groupe_des_dames_eebv = "data_chant_07_groupe_des_dames_eebv.json";
  // static String data_chant_08_groupe_sarment_eebv = "data_chant_08_groupe_sarment_eebv.json";
  static String data_chant_09_groupe_praise_him_eebv =
      "data_chant_09_groupe_praise_him_eebv.json";

  // static String data_chant_10_groupe_voice_of_faith_eebv = "data_chant_10_groupe_voice_of_faith_eebv.json";
  // static String data_chant_11_grouv_eebv = "data_chant_11_grouv_eebv.json";
  static String data_chant_12_desperance = "data_chant_12_desperance.json";
  static String data_chant_13_melodies_joyeuses =
      "data_chant_13_melodies_joyeuses.json";
  static String data_chant_14_haiti_chante_avec_radio_lumiere =
      "data_chant_14_haiti_chante_avec_radio_lumiere.json";
  static String data_chant_15_la_voix_du_reveil =
      "data_chant_15_la_voix_du_reveil.json";
  static String data_chant_16_reveillons_nous =
      "data_chant_16_reveillons_nous.json";
  static String data_chant_17_echos_des_elus =
      "data_chant_17_echos_des_elus.json";
  static String data_chant_18_lombre_du_reveil =
      "data_chant_18_lombre_du_reveil.json";
  static String data_chant_19_gloire_a_lagneau =
      "data_chant_19_gloire_a_lagneau.json";
  static String data_chant_20_reveillons_nous_chretiens =
      "data_chant_20_reveillons_nous_chretiens.json";
  static String data_chant_21_les_cantiques_de_beraca =
      "data_chant_21_les_cantiques_de_beraca.json";
  static String data_chant_22_des_cantiques_speciaux =
      "data_chant_22_des_cantiques_speciaux.json";

  //endregion

//endregion

  //region [ Align( Right, Center, Left ) ]
  static const String alignRight = 'right';
  static const String alignCenter = 'center';
  static const String alignLeft = 'left';

  //endregion

  //region [ Video Link ]
  static final String SPLIT_DATA_URL_VIDEO = "C.C.G";

  //endregion

  static const String bookCE = 'CE';
  static const String bookCEEBV = 'CEEBV';

  //static String appName = Environment.appName;
  //static String copyRightAppName = Environment.appName;

  static String copyRightDeveloppeur =
      '©2015-${DateTime.now().year.toString()} Develop by Jean Fritz DUVERSEAU';



  //region Quiz
  static int ordreCanonique = 1;
  static int uniquementPourUnLivre = 2;
  static int monOrdreDeLecture = 3;
  //endregion

//region [ Plan de Lecture ]
  static String codeCanonique = 'CANONI-', codeLectureCanoniqueEn2Ans = '${codeCanonique}1',  codeLectureCanoniqueEn1An='${codeCanonique}2', codeLectureCanoniqueEn6Mois='${codeCanonique}3', codeLectureCanoniqueEn90Jours='${codeCanonique}4';
  static String codeChronologique = 'CHRONO-', codeLectureChronologiqueEn2Ans = '${codeChronologique}5',  codeLectureChronologiqueEn1An='${codeChronologique}6', codeLectureChronologiqueEn6Mois='${codeChronologique}7', codeLectureChronologiqueEn90Jours='${codeChronologique}8';
  static String codeHistorique = 'HISTOR-', codeLectureHistoriqueEn2Ans = '${codeHistorique}9',  codeLectureHistoriqueEn1An='${codeHistorique}10', codeLectureHistoriqueEn6Mois='${codeHistorique}11', codeLectureHistoriqueEn90Jours='${codeHistorique}12';
  static String codeAT = 'ANCTES-', codeLectureATEn6Mois = '${codeAT}13', codeLectureATEn3Mois='${codeAT}14';
  static String codeNT = 'NOUTES-', codeLectureNTEn6Mois = '${codeNT}15', codeLectureNTEn3Mois='${codeNT}16';

  static List<String> listCodeLectureCanonique = [
    codeLectureCanoniqueEn2Ans, codeLectureCanoniqueEn1An, codeLectureCanoniqueEn6Mois, codeLectureCanoniqueEn90Jours,
  ];
  static List<String> listCodeLectureChronologique = [
    codeLectureChronologiqueEn2Ans, codeLectureChronologiqueEn1An,codeLectureChronologiqueEn90Jours,codeLectureChronologiqueEn6Mois,
  ];
  static List<String> listCodeLectureHistorique = [
    codeLectureHistoriqueEn2Ans,codeLectureHistoriqueEn1An,codeLectureHistoriqueEn90Jours,codeLectureHistoriqueEn6Mois,
  ];
  static List<String> listCodeLectureAT = [
    codeLectureATEn6Mois, codeLectureATEn3Mois,
  ];
  static List<String> listCodeLectureNT = [
    codeLectureNTEn6Mois, codeLectureNTEn3Mois,
  ];
  static List<String> listCodePlanDeLectureLocal = [
    codeLectureCanoniqueEn2Ans, codeLectureCanoniqueEn1An, codeLectureCanoniqueEn6Mois, codeLectureCanoniqueEn90Jours,
    codeLectureChronologiqueEn2Ans, codeLectureChronologiqueEn1An,codeLectureChronologiqueEn90Jours,codeLectureChronologiqueEn6Mois,
    codeLectureHistoriqueEn2Ans,codeLectureHistoriqueEn1An,codeLectureHistoriqueEn90Jours,codeLectureHistoriqueEn6Mois,
    codeLectureATEn6Mois, codeLectureATEn3Mois,
    codeLectureNTEn6Mois, codeLectureNTEn3Mois,
  ];

  static isCodeLectureListSystem( { required List<String> codeList, required String? codeLecture } ){
    return ( codeList.indexWhere((element) => element==codeLecture ) >=0 ) ? true : false;
  }

  static const groupe0 = 'label_OrdreCanonique';
  static const groupe1 = 'label_OrdreChronologique';
  static const groupe2 = 'label_OrdreHistorique';
//endregion

//region [ Plan de Lecture ]
  static const codeCategorieUserPLAN = 'USER-PLAN';
  static const codeUserSystem = 'SYS';
//endregion

//region [ Chapitre / AT | NT | ALL ]
  static const int maxOfBook66=66;
  static const int nbrChapitreATeNT = 1189;
  static const int nbrChapitreAT = 929;
  static const int nbrChapitreNT = 260;
  static const int nbrChapitreOrdreChronologique = nbrChapitreATeNT;
  static const int nbrChapitreOrdreHistorique = nbrChapitreATeNT;

  static const int groupeIdNA = 0;
  static const int groupeIdAT = 1;
  static const int groupeIdNT = 2;
  static const List<int> groupeIds =[
    groupeIdNA, groupeIdAT, groupeIdNT
  ];

  static const int idFirstBookAT = 1;
  static const int idLastBookAT = 39;
  static const int idFirstBookNT = 40;
  static const int idLastBookNT = 66;
//endregion

}

final deviceSize = MediaQuery.of(Get.context!).size;
final ratio = deviceSize.width / deviceSize.height;
final animationTransitionPoint = ratio < 9 / 16 ? 0.5 : 0.2;
//region Privilege
String duverseau_jeanfritz_gmail_com = "duverseau.jeanfritz@gmail.com";
String peterfritz2007_gmail_com = "peterfritz2007@gmail.com";
String chantchoraleetgroupe_gmail_com = "chantchoraleetgroupe@gmail.com";
String info_rezo509_com = "info@rezo509.com";
String jeudyfred_saskia_gmail_com = "jeudyfred.saskia@gmail.com";
String emmanuelduvers_gmail_com = "emmanuel.duvers@gmail.com";
String duverseaujeandavid1_gmail_com = "duverseau.jeandavid1@gmail.com";
//endregion


//region [  ]

//endregion