// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/utils/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageIconResources {
  static IconData checkCircleActiveModeSombreOrNot() =>
      Get.isDarkMode ? Icons.check_circle : Icons.check_box_outline_blank;

  static IconData share() =>
      CheckPlatform().isIOS ? CupertinoIcons.share : Icons.share_outlined;

  static const String packagesNameBrain_dev_tools = 'packages/brain_dev_tools';
  // static const String b11 = 'assets/img/dashboard/new_bg/b11.jpg';
  // static const String b22 = 'assets/img/dashboard/new_bg/b22.jpg';
  // static const String b23 = 'assets/img/dashboard/new_bg/b23.jpg';
  // static const String img_joie_melodie = 'assets/img/dashboard/new_bg/img_joie_melodie.jpg';
  // static const String img_croix = 'assets/img/dashboard/new_bg/img_croix.jpg';
  // static const String img_reveil_chretien = 'assets/img/dashboard/new_bg/img_reveil_chretien.jpg';
  // static const String img_cantique_beraca = 'assets/img/dashboard/new_bg/img_cantique_beraca.jpg';
  // static const String img_cs_00 = 'assets/img/dashboard/new_bg/img_cs_01.jpg';
  // static const String img_ga_00 = 'assets/img/dashboard/new_bg/img_ga_00.jpg';
  // static const String img_rnc_00 = 'assets/img/dashboard/new_bg/img_rnc_00.jpg';
  // static const String img_ee_00 = 'assets/img/dashboard/new_bg/img_ee_00.jpg';
  // static const String img_cf_00 = 'assets/img/dashboard/new_bg/img_cf_00.jpg';
  // static const String img_or_00 = 'assets/img/dashboard/new_bg/img_or_00.jpg';

  // static const String album_group = 'assets/img/dashboard/new_bg/album_group.jpg';
  //
  // static const String logolaSainteBible = 'assets/img/logo_la_sainte_bible_round.png';
  // static const String ic_logolaSainteBible = 'assets/img/dashboard/ic_logo_la_sainte_bible.png';

  //region [ Assets Path | image ]
  // static const String img_eebv04_choeur_d_adoration = 'assets/img/dashboard/img_eebv04_choeur_d_adoration.png';
  // static const String img_00_new_groupe_4re = 'assets/img/dashboard/img_00_new_groupe_4re_.png';
  //
  // static const String assetsPath_BannerBrainDev_300x50 = 'assets/img/pubs/banner_braindev_300x50_1.png';
  // static const String assetsPath_BannerBraindev_300x250 = 'assets/img/pubs/banner_braindev_300x250_1.png';
  //
  // static const String assetsPath_BannerRezo509_320x50 = 'assets/img/pubs/banner_rezo509_320x50.png';
  // static const String assetsPath_BannerRezo509_300x50 = 'assets/img/pubs/banner_rezo509_300x50_1.png';
  // static const String assetsPath_BannerRezo509_300x250 = 'assets/img/pubs/banner_rezo509_300x250_1.png';
  //
  // static const String assetsPath_BannerLaBible_300x50 = 'assets/img/pubs/banner_labible_300x50_1.png';
  // static const String assetsPath_BannerLaBible_300x250 = 'assets/img/pubs/banner_labible_300x250_1.png';
  //
  // static const String assetsPath_BannerCCG_300x50 = 'assets/img/pubs/banner_ccg_300x50_1.png';
  // static const String assetsPath_BannerCCG_300x250_1 = 'assets/img/pubs/banner_ccg_300x250_1.png';
  // static const String assetsPath_BannerCCG_300x250_2 = 'assets/img/pubs/banner_ccg_300x250_2.png';

  static const String assetsNoInternetPath = '$packagesNameBrain_dev_tools/assets/img/no-internet.png';
  static const String assetsNoRecordFoundPath = '$packagesNameBrain_dev_tools/assets/img/no-record-found.gif';
  //endregion

  static const String assetsBgHeaderPath = '$packagesNameBrain_dev_tools/assets/img/bg/bg_header.jpg';


  static const String assetsLogoCMPath = '$packagesNameBrain_dev_tools/assets/img/logo_cm.png';
  static const String assetsLogoRezo509Path = '$packagesNameBrain_dev_tools/assets/img/logo_rezo509.png';
  static const String assetsLoginPath = '$packagesNameBrain_dev_tools/assets/img/login.png';
  static const String assetsCoinPath = '$packagesNameBrain_dev_tools/assets/img/coin.gif';
  static const String assetsCoinStarPath = '$packagesNameBrain_dev_tools/assets/img/coinstar.gif';
  static const String assetsQuizPath = '$packagesNameBrain_dev_tools/assets/img/quiz.png';

  static const String assetsFlagHaitiPath = '$packagesNameBrain_dev_tools/assets/img/flags/flag_haiti.png';
  static const String assetsFlagUsaPath = '$packagesNameBrain_dev_tools/assets/img/flags/flag_usa.png';
  static const String assetsFlagEspagnolPath = '$packagesNameBrain_dev_tools/assets/img/flags/flag_espagnol.png';
  static const String assetsFlagFrancePath = '$packagesNameBrain_dev_tools/assets/img/flags/flag_france.png';
  static const String assetsFlagAutresPath = '$packagesNameBrain_dev_tools/assets/img/flags/flag_autres.png';

  // Folder ic
  // static const String assetsIcSolfegePath = '$packagesNameBrain_dev_tools/assets/img/ic/ic_solfege.png';
  // static const String assetsIcPlayerPath = '$packagesNameBrain_dev_tools/assets/img/ic/img_player_1.gif';
  // static const String assetsIcFrequencePath = '$packagesNameBrain_dev_tools/assets/img/ic/frequence.gif';

  //region [ FLAGS ]
  static const String flagSaudi = '$packagesNameBrain_dev_tools/assets/img/flags/flag_ar.png';
  static const String flagEnglish = '$packagesNameBrain_dev_tools/assets/img/flags/flag_usa.png';
  static const String flagFrancais = '$packagesNameBrain_dev_tools/assets/img/flags/flag_france.png';
  static const String flagEspagnole = '$packagesNameBrain_dev_tools/assets/img/flags/flag_espagnol.png';
  static const String flagCreole = '$packagesNameBrain_dev_tools/assets/img/flags/flag_haiti.png';

//endregion
  static const String ic_video = '$packagesNameBrain_dev_tools/assets/img/ic/ic_video.png';

  // static const String get_in_on_apple_store = '$packagesNameBrain_dev_tools/assets/img/get_in_on_apple_store.png';
  // static const String get_in_on_google_store = '$packagesNameBrain_dev_tools/assets/img/get_in_on_google_store.png';

  //region [ BG ]
  static const String bg_ccg_light = '$packagesNameBrain_dev_tools/assets/img/bg/bg_ccg_light.png';
  static const String bg_ccg_dark = '$packagesNameBrain_dev_tools/assets/img/bg/bg_ccg_dark.png';
  static const String bg_chant_desperance_light = '$packagesNameBrain_dev_tools/assets/img/bg/bg_chant_desperance_light.png';
  static const String bg_chant_desperance_dark = '$packagesNameBrain_dev_tools/assets/img/bg/bg_chant_desperance_dark.png';
  static const String bg_chant_lyric_light = '$packagesNameBrain_dev_tools/assets/img/bg/bg_chant_lyric_light.png';
  // static const String ce_bg_transparent = '$packagesNameBrain_dev_tools/assets/img/bg/ce_bg_transparent.png';

  static const String assetsFlagsPath = '$packagesNameBrain_dev_tools/assets/img/flags/';
  static const String assetsLogoCcgPath = '$packagesNameBrain_dev_tools/assets/img/logo_ccg.png';

  //endregion
  static const String logoUser = '$packagesNameBrain_dev_tools/assets/img/logo_user.png';
  static const String placeholder = '$packagesNameBrain_dev_tools/assets/img/placeholder.jpg';
  static const String no_data = '$packagesNameBrain_dev_tools/assets/img/no-record-found.gif';

  static IconData iconsShare =
  checkPlatform.isApple ? CupertinoIcons.share : Icons.share;
  static IconData favorite_sharp =
  checkPlatform.isApple ? CupertinoIcons.play_circle : Icons.favorite_sharp;

  static youtubeIconWidget({double horizontal = 5, double vertical = 10}) {
    return Container(
        //height: 15,width: 15,
        margin:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: ColorResources.getColorOrSetPrimaryColor()),
        child: const Icon(
          Icons.play_arrow,
          color: Colors.white,
        ));
  }
}
