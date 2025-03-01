// ignore_for_file: constant_identifier_names

class EnvironmentOld
{
  // static EnumEnvironmentType? _current;
  //
  // static Future<EnumEnvironmentType> current() async {
  //   if (_current != null) {
  //     return _current!;
  //   }
  //
  //   final packageInfo = await PackageInfo.fromPlatform();
  //
  //   switch (packageInfo.packageName) {
  //     case Constant.packageChantChoraleEtGroupeAndroid:
  //     case Constant.packageChantChoraleEtGroupeIos:
  //       _current = EnumEnvironmentType.chantchoraleetgroupe; break;
  //
  //     case Constant.packageChantdesperanceAndroid:
  //     case Constant.packageChantdesperanceIos:
  //       _current = EnumEnvironmentType.chantdesperance; break;
  //
  //     case Constant.packageLyricevangeliqueAndroid:
  //     case Constant.packageLyricevangeliqueIos:
  //       _current = EnumEnvironmentType.lyricevangelique; break;
  //
  //     case Constant.packageChantlyricAndroid:
  //     case Constant.packageChantlyricIos:
  //       _current = EnumEnvironmentType.chantlyric; break;
  //
  //     default:
  //       _current = EnumEnvironmentType.chantchoraleetgroupe;
  //   }
  //   return _current!;
  // }

  // static get envType {
  //   return flavorConfigVariables(variableName: ApiVariables.environmentType);
  // }

  // static flavorConfigVariables({required String variableName}){
  //   return FlavorConfig.instance.variables[variableName];
  // }

}
/*

  flutterfire configure \
  --project=chant-chorale-et-groupe \
  --out=lib/firebase_options_ChantChoraleEtGroupe.dart \
  --ios-bundle-id=net.braindev.chantchoraleetgroupe \
  --android-app-id=net.eebv.choralecentraleeebv


  flutterfire configure \
  --project=chant-chorale-et-groupe \
  --out=lib/firebase_options_ChantDesperance.dart \
  --ios-bundle-id=net.braindev.chantdesperance \
  --android-app-id=net.braindev.chantdesperance


  flutterfire configure \
  --project=chant-chorale-et-groupe \
  --out=lib/firebase_options_LyricEvangelique.dart \
  --ios-bundle-id=net.braindev.lyric.evangelique \
  --android-app-id=net.braindev.lyric.evangelique


  flutterfire configure \
  --project=chant-chorale-et-groupe \
  --out=lib/firebase_options_ChantLyric.dart \
  --ios-bundle-id=net.braindev.lyrics \
  --android-app-id=net.braindev.lyrics

 firebase projects:list

*/

/*
flutterfire configure \
  --project=ffoneapp \
  --out=lib/firebase_options_ffoneapp.dart \
  --ios-bundle-id=net.braindev.ffoneapp \
  --android-app-id=net.braindev.ffoneapp


flutterfire configure \
  --project=fftwoapp \
  --out=lib/firebase_options_fftwoapp.dart \
  --ios-bundle-id=net.braindev.fftwoapp \
  --android-app-id=net.braindev.fftwoapp

flutterfire configure \
  --project=ffoneandtwoapp \
  --ios-bundle-id=net.braindev.ffoneapp \
  --ios-bundle-id=net.braindev.fftwoapp \
  --android-app-id=net.braindev.ffoneapp \
  --android-app-id=net.braindev.fftwoapp

  flutterfire configure \
  --project=ffoneandtwoapp \
  --out=lib/firebase_options_ffoneapp.dart \
  --ios-bundle-id=net.braindev.ffoneapp \
  --android-app-id=net.braindev.ffoneapp


flutterfire configure \
  --project=ffoneandtwoapp \
  --out=lib/firebase_options_fftwoapp.dart \
  --ios-bundle-id=net.braindev.fftwoapp \
  --android-app-id=net.braindev.fftwoapp
*/