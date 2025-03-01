
import 'package:brain_dev_tools/I10n/l10n.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:brain_dev_tools/tools/utils/image_icon_resources.dart';
import 'package:flutter/material.dart';

getFlags(String flags, { double? width }) {
  if(flags==L10n.codeCreole) {
    return Image.asset(ImageIconResources.flagCreole, width: width,);
  }
  if(flags==L10n.codeFrancais) {
    return Image.asset('${ImageIconResources.assetsFlagsPath}flag_france.png');
  }
  if(flags==L10n.codeAnglais) {
    return Image.asset('${ImageIconResources.assetsFlagsPath}flag_usa.png');
  }
  if(flags==L10n.codeEspagnole) {
    return Image.asset('${ImageIconResources.assetsFlagsPath}flag_espagnol.png');
  }
  return Image.asset('${ImageIconResources.assetsFlagsPath}flag_france.png');
}
getFlagsLangue(Langue langue) {
  if(langue==Langue.creole) {
    return Image.asset('${ImageIconResources.assetsFlagsPath}flag_haiti.png');
  }
  if(langue==Langue.francais) {
    return Image.asset('${ImageIconResources.assetsFlagsPath}flag_france.png');
  }
  if(langue==Langue.anglais) {
    return Image.asset('${ImageIconResources.assetsFlagsPath}flag_usa.png');
  }
  if(langue==Langue.espagnole) {
    return Image.asset('${ImageIconResources.assetsFlagsPath}flag_espagnol.png');
  }

  return Image.asset('i${ImageIconResources.assetsFlagsPath}flag_france.png');
}
