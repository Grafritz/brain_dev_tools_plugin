import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TypeSafeConversion {
  static final RegExp _numeric = RegExp(r'^-?[0-9]+$');
  static RegExp intV = RegExp(r'^(?:-?(?:0|[1-9][0-9]*))$');
  static final RegExp _float =
      RegExp(r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$');

  //region [ Translate ]
  static String translateIntToBoolString(int pInteger) {
    switch (pInteger) {
      case 1:
      case -1:
        return "Yes";
      default:
        return "No";
    }
  }

  static String translateBoolString(bool pBoolean) {
    if (pBoolean) {
      return "1";
    } else {
      return "0";
    }
  }
  static int translateBoolInt(bool pBoolean) {
    return (pBoolean)?1:0;
  }

  static bool translateIntToBool(int pInteger) {
    switch (pInteger) {
      case 1:
      case -1:
        return true;
      default:
        return false;
    }
  }

  static bool translateStringToBool(String pString) {
    // if( pString == null){
    //   return false;
    // }
    switch (pString) {
      case "1":
        return true;
      default:
        return false;
    }
  }

  static int translateStringToInteger(String pString) {
    // if( pString == null){
    //   return 0;
    // }
    switch (pString) {
      case "1":
        return 1;
      case "":
        return 0;
      default:
        return 0;
    }
  }

  static int translateStringToInt(String pString) {
    // if( pString == null){
    //   return 0;
    // }
    switch (pString) {
      case "1":
        return 1;
      case "":
        return 0;
      default:
        return 0;
    }
  }

  static bool translateToBool(bool pVal) {
    // if (pVal == null) {
    //   return false;
    // }
    if (pVal) {
      return true;
    } else {
      return false;
    }
  }

  static translateFormatDateShort({String? date, String? langue}) {
    if (date == null) {
      return '';
    }
    if (langue == null || langue == 'ht') {
      langue = 'fr';
    }

    var formatLong = DateFormat("dd MMM yyyy", langue);
    var formatToSave = DateFormat("dd-MM-yyyy", langue);
    return formatLong.format(formatToSave.parse(date));
  }

  static translateFormatDateLong({String? date, String? langue}) {
    if (date == null) {
      return '';
    }
    if (langue == null || langue == 'ht') {
      langue = 'fr';
    }
    var formatToSave =
        DateFormat("yyyy-MM-dd h:mm:s", langue); // 2020-07-12 22:36:50
    var formatToDisplay = DateFormat("dd-MM-yyyy h:mm:s", langue);
    if (date != '') {
      return formatToDisplay.format(formatToSave.parse(date));
    }
    return '';
  }

  static String getFormatDateLong1DateTimeNow({ String? format }) {
    format ??= 'yyyy-MM-dd h:mm:s';
    var formatToSave = DateFormat(format);
    return formatToSave.format( DateTime.now() );
  }

  static String getDateYMMMMd(String value, {String lang = 'fr'}) {
    try {
      initializeDateFormatting();
      if (value.isEmpty) {
        return '';
      }
      if (lang.isEmpty || lang == 'ht') {
        lang = 'fr';
      }
      final payD = DateTime.parse(value);
      return DateFormat('d MMM yyyy', lang).format(payD);
    } catch (e) {
      debugPrint(e.toString());
      return getDatedMMMMY(value, lang: lang);
    }
  }

  static String getDatedMMMMY(String value, {String lang = 'fr'}) {
    try {
      initializeDateFormatting();
      if (value.isEmpty) {
        return '';
      }
      if (lang.isEmpty || lang == 'ht') {
        lang = 'fr';
      }
      var formatToSave = DateFormat("dd-MM-yyyy h:mm:s", lang);
      DateTime newDate = formatToSave.parse(value);
      return DateFormat('d MMM yyyy', lang).format(newDate);
    } catch (e) {
      debugPrint(e.toString());
      return '';
    }
  }

  static String getFormatDateLongDateTimeNow({String? format}) {
    format ??= 'dd-MM-yyyy h:mm:s';
    var formatToSave = DateFormat(format);
    return formatToSave.format(DateTime.now());
  }

  static translateFormatDateCode() {
    var formatToSave = DateFormat("yyyyMMdd-hhmmsS");
    return formatToSave.format(DateTime.now());
  }

  static translateFormatDateCodeInt() {
    var formatToSave = DateFormat("yyyyMMddhhmms");
    // Tools.logCat('formatToSave.format( DateTime.now() ): ${formatToSave.format( DateTime.now() )}');
    return formatToSave.format( DateTime.now() );
  }

  static translateFormatDateIdInt() {
    var formatToSave = DateFormat("hhmms");
    // Tools.logCat('formatToSave.format( DateTime.now() ): ${formatToSave.format( DateTime.now() )}');
    return nullSafeInt( formatToSave.format( DateTime.now() ) );
  }

  static getDateTimeNow({ String? format, String lang = 'fr_FR' }) {
    format ??= 'yyyy-MM-dd';
    initializeDateFormatting();
    if (lang.isEmpty || lang == 'ht') {
      lang = 'fr_FR';
    }
    return DateFormat(format, lang).format( DateTime.now() );
  }
  //endregion

  //region [ Null Safe ]
  static double nullSafeDouble(Object? arg) {
    double returnValue = 0;
    //RegExp pattern;
    //Matcher matcher;
    if (arg == null) {
      returnValue = 0;
    } else {
      try {
        if (arg.toString().isEmpty) {
          returnValue = 0;
        } else {
          RegExp regExp = _float;//RegExp regExp = RegExp(r'^-?[0-9]*[.]?[0-9]{0,3}$');
          bool matcher = regExp.hasMatch(arg.toString());
          if ( matcher ) {
            returnValue = double.parse( arg.toString() );
          } else {
            returnValue = 0;
          }
        }
      } on  Exception {
        returnValue = 0;
      }
    }
    return returnValue;
  }

  static double nullSafeDoubleUnsigned(Object? arg) {
    double returnValue = 0;
    if (arg == null) {
      returnValue = 0;
    } else {
      try {
        if (arg.toString().isEmpty) {
          returnValue = 0;
        } else {
          RegExp regExp = _float;//RegExp regExp = RegExp(r'^-?[0-9]*[.]?[0-9]{0,2}$');
          bool matcher = regExp.hasMatch(arg.toString());
          if ( matcher ) {
            returnValue = double.parse( arg.toString() );
            if( returnValue<0) {
              returnValue = 0;
            }
          } else {
            returnValue = 0;
          }
        }
      } on  Exception {
        returnValue = 0;
      }
    }
    return returnValue;
  }

  static int nullSafeInt(Object? arg, { int defaultInt=0 }) {
    int returnValue = defaultInt;
    if (arg == null) {
      returnValue = defaultInt;
    } else {
      try {
        if (arg.toString().isEmpty) {
          returnValue = defaultInt;
        } else {
          RegExp regExp = _numeric; //RegExp(r"^([0-9]*)$");
          bool matcher = regExp.hasMatch(arg.toString());
          if (matcher) {
            returnValue = int.parse(arg.toString());
          } else {
            returnValue = defaultInt;
          }
        }
      } on Exception {
        returnValue = defaultInt;
      }
    }
    return returnValue;
  }

  static String nullSafeString(Object? arg, { String defaultValue='' }) {
    String returnValue = defaultValue;
    if (arg == null) {
      returnValue = defaultValue;
    } else {
      try {
        if (arg.toString().isEmpty) {
          returnValue = defaultValue;
        } else {
          returnValue = "$arg";
        }
      } on Exception {
        returnValue = defaultValue;
      }
    }
    return returnValue;
  }

  static bool nullSafeBool(Object? arg) {
    bool returnValue = false;

    if ( arg==null ){
      returnValue = false;
    } else {
      try {
        if (arg.toString().isEmpty) {
          returnValue = false;
        } else {
          String str = arg.toString().toLowerCase();
          if(str == '1' || str == 'true'){
            returnValue = true;
          }else {
            returnValue = false;
          }
        }
      } on Exception {
        returnValue = false;
      }
    }
    return returnValue;
  }
//endregion

  /// helper to get the first int value in a query
  /// Useful for COUNT(*) queries
  static double firstDoubleValue(List<Map<String, dynamic>> list) {
    if (list.isNotEmpty) {
      final firstRow = list.first;
      if (firstRow.isNotEmpty) {
        return nullSafeDouble(firstRow.values.first);
      }
    }
    return 0;
  }

  static double nullSafeFirstDoubleValue(List<Map<String, dynamic>> list) =>
      firstDoubleValue(list);
}

//region [ Translate ]
String translateIntToBoolString(int pInteger) {
  switch (pInteger) {
    case 1:
    case -1:
      return "Yes";
    default:
      return "No";
  }
}
//endregion

//region [ Null Safe ]
//endregion
