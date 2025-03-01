
import 'package:flutter/foundation.dart';

String tag = "GRAFRITZ-LOG: ";
void logCat(Object object) {
  if (!kReleaseMode) {
    debugPrint('$tag: $object');
  }
}
void println(Object object) {
  logCat(object);
}
void logError( ex, {StackTrace? trace, String position=''}){
  logCat('ERROR: [ $position ] ${ex.toString()}');
  logCat('ERROR: [ $position ] $trace');
}