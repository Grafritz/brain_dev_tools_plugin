// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:brain_dev_tools/tools/constant.dart';

import 'helpers.dart';
import 'validator.dart';

Map _defaultNormalizeEmailOptions = {'lowercase': true};

/// convert the input to a string
String toString(input) {
  if (input == null || (input is List && input.isEmpty)) {
    input = '';
  }
  return input.toString();
}

/// convert the input to a date, or null if the input is not a date
DateTime? toDate(String str) {
  try {
    return DateTime.parse(str);
  } catch (e) {
    return null;
  }
}

/// convert the input to a float, or NAN if the input is not a float
double toFloat(String str) {
  try {
    return double.parse(str);
  } catch (e) {
    return double.nan;
  }
}

/// convert the input to a float, or NAN if the input is not a float
double toDouble(String str) {
  return toFloat(str);
}

/// convert the input to an integer, or NAN if the input is not an integer
num toInt(String str, {int radix = 10}) {
  try {
    return int.parse(str, radix: radix);
  } catch (e) {
    try {
      return double.parse(str).toInt();
    } catch (e) {
      return double.nan;
    }
  }
}

/// convert the input to a boolean.
///
/// Everything except for '0', 'false' and ''
/// returns `true`. In `strict` mode only '1' and 'true' return `true`.
bool toBoolean(String str, [bool? strict]) {
  if (strict == true) {
    return str == '1' || str == 'true';
  }
  return str != '0' && str != 'false' && str != '';
}

/// trim characters (whitespace by default) from both sides of the input
String trim(String str, [String? chars]) {
  RegExp pattern = (chars != null)
      ? RegExp('^[$chars]+|[$chars]+\$')
      : RegExp(r'^\s+|\s+$');
  return str.replaceAll(pattern, '');
}

/// trim characters from the left-side of the input
String lTrim(String str, [String? chars]) {
  var pattern = chars != null ? RegExp('^[$chars]+') : RegExp(r'^\s+');
  return str.replaceAll(pattern, '');
}

/// trim characters from the right-side of the input
String rTrim(String str, [String? chars]) {
  var pattern = chars != null ? RegExp('[$chars]+\$') : RegExp(r'\s+$');
  return str.replaceAll(pattern, '');
}

/// remove characters that do not appear in the whitelist.
///
/// The characters are used in a RegExp and so you will need to escape
/// some chars.
String whitelist(String str, String chars) {
  return str.replaceAll(RegExp('[^$chars]+'), '');
}

/// remove characters that appear in the blacklist.
///
/// The characters are used in a RegExp and so you will need to escape
/// some chars.
String blacklist(String str, String chars) {
  return str.replaceAll(RegExp('[$chars]+'), '');
}

/// remove characters with a numerical value < 32 and 127.
///
/// If `keep_new_lines` is `true`, newline characters are preserved
/// `(\n and \r, hex 0xA and 0xD)`.
String stripLow(String str, [bool? keepNewLines]) {
  String chars = keepNewLines == true
      ? '\x00-\x09\x0B\x0C\x0E-\x1F\x7F'
      : '\x00-\x1F\x7F';
  return blacklist(str, chars);
}

/// replace `<`, `>`, `&`, `'` and `"` with HTML entities
String escape(String str) {
  return (str
      .replaceAll( RegExp(r'&'), '&amp;')
      .replaceAll( RegExp(r'"'), '&quot;')
      .replaceAll( RegExp(r"'"), '&#x27;')
      .replaceAll( RegExp(r'<'), '&lt;')
      .replaceAll( RegExp(r'>'), '&gt;'));
}

/// canonicalize an email address.
///
/// `options` is an `Map` which defaults to
/// `{ lowercase: true }`. With lowercase set to true, the local part of the
/// email address is lowercased for all domains; the hostname is always
/// lowercased and the local part of the email address is always lowercased
/// for hosts that are known to be case-insensitive (currently only GMail).
/// Normalization follows special rules for known providers: currently,
/// GMail addresses have dots removed in the local part and are stripped of
/// tags (e.g. `some.one+tag@gmail.com` becomes `someone@gmail.com`) and all
/// `@googlemail.com` addresses are normalized to `@gmail.com`.
String normalizeEmail(String email, [Map? options]) {
  options = merge(options!, _defaultNormalizeEmailOptions);
  if (isEmail(email) == false) {
    return '';
  }

  List parts = email.split('@');
  parts[1] = parts[1].toLowerCase();

  if (options['lowercase'] == true) {
    parts[0] = parts[0].toLowerCase();
  }

  if (parts[1] == 'gmail.com' || parts[1] == 'googlemail.com') {
    if (options['lowercase'] == false) {
      parts[0] = parts[0].toLowerCase();
    }
    parts[0] = parts[0].replaceAll('.', '').split('+')[0];
    parts[1] = 'gmail.com';
  }
  return parts.join('@');
}
replaceSpecialChar(String value){
  return value.replaceAll('¶ ', '').replaceAll('¶', '');
}


class Sanitizer {
  //region [ HTML ]
  static String GetTextFromHtml(String htmlText) {
    RegExp pattern = RegExp(r'\<[^\>]+\>');
    return htmlText.replaceAll(pattern, "");
  }

  static String utf8Word(String sentences) {
    String val = "";
    val = sentences.replaceAll("à", "a")
        .replaceAll("â", "a")
        .replaceAll("à", "a")
        .replaceAll("å", "a")
        .replaceAll("À", "a")
        .replaceAll("Á", "a")
        .replaceAll("Â", "a")
        .replaceAll("Ã", "a")
        .replaceAll("Ä", "a")
        .replaceAll("Å", "a");
    val = val
        .replaceAll("é", "e")
        .replaceAll("è", "e")
        .replaceAll("ê", "e")
        .replaceAll("ë", "e")
        .replaceAll("È", "e")
        .replaceAll("É", "e")
        .replaceAll("ē", "e")
        .replaceAll("Ē", "e")
        .replaceAll("Ë", "e")
        .replaceAll("Ê", "e");
    val = val
        .replaceAll("ò", "o")
        .replaceAll("ó", "o")
        .replaceAll("ô", "o")
        .replaceAll("õ", "o")
        .replaceAll("ö", "o")
        .replaceAll("Ò", "o")
        .replaceAll("Ó", "o")
        .replaceAll("Ô", "o")
        .replaceAll("Õ", "o")
        .replaceAll("Ö", "o");
    val = val
        .replaceAll("ï", "i")
        .replaceAll("ì", "i")
        .replaceAll("í", "i")
        .replaceAll("î", "i")
        .replaceAll(",", "")
        .replaceAll("&", "");
    val = val
        .replaceAll("ù", "u")
        .replaceAll("ú", "u")
        .replaceAll("û", "u")
        .replaceAll("ü", "u")
        .replaceAll(".", "")
        .replaceAll("%", "")
        .replaceAll("#", "")
        .replaceAll("@", "");
    //val = val/*.replaceAll("$", "")*/;
    val = val.replaceAll("æ", "").replaceAll("↔", "");
    val = val
        .replaceAll("'", "")
        .replaceAll("ç", "c")
        .replaceAll("+", "")
        .replaceAll("*", "")
        .replaceAll("\\", "");
    val = val
        .replaceAll("/", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("{", "")
        .replaceAll("}", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll("|", "");
    val = val
        .replaceAll("<", "")
        .replaceAll(">", "")
        .replaceAll("   ", " ")
        .replaceAll("  ", " ")
        .replaceAll(" ", "_")
        .replaceAll("\"", "")
        .replaceAll("^", "")
        .replaceAll("`", "")
        .replaceAll("~", "")
        .replaceAll("!", "");
    val = val.replaceAll(":", "").replaceAll("-", "").replaceAll("’", "");
    return val;
  }

  static String UnCodeSpecialChar(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("à", "a")
        .replaceAll("â", "a")
        .replaceAll("à", "a")
        .replaceAll("å", "a")
        .replaceAll("À", "a")
        .replaceAll("Á", "a")
        .replaceAll("Â", "a")
        .replaceAll("Ã", "a")
        .replaceAll("Ä", "a")
        .replaceAll("Å", "a");
    val = val
        .replaceAll("é", "e")
        .replaceAll("è", "e")
        .replaceAll("ê", "e")
        .replaceAll("ë", "e")
        .replaceAll("È", "e")
        .replaceAll("É", "e")
        .replaceAll("ē", "e")
        .replaceAll("Ē", "e")
        .replaceAll("Ë", "e")
        .replaceAll("Ê", "e");
    val = val
        .replaceAll("ò", "o")
        .replaceAll("ó", "o")
        .replaceAll("ô", "o")
        .replaceAll("õ", "o")
        .replaceAll("ö", "o")
        .replaceAll("Ò", "o")
        .replaceAll("Ó", "o")
        .replaceAll("Ô", "o")
        .replaceAll("Õ", "o")
        .replaceAll("Ö", "o");
    val = val
        .replaceAll("ï", "i")
        .replaceAll("ì", "i")
        .replaceAll("í", "i")
        .replaceAll("î", "i");
    val = val
        .replaceAll("ù", "u")
        .replaceAll("ú", "u")
        .replaceAll("û", "u")
        .replaceAll("ü", "u");
    val = val.replaceAll("ç", "c");
    return val;
  }

  static String DECODE_UTF_8(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("&", "&amp;").replaceAll(
        "÷", "&divide;"); //.replaceAll(">", "&lt;").replaceAll(">", "&gt;");

    val = val
        .replaceAll("À", "&Agrave;")
        .replaceAll("Á", "&Aacute;")
        .replaceAll("Â", "&Acirc;")
        .replaceAll("Ã", "&Atilde;")
        .replaceAll("Ä", "&Auml;")
        .replaceAll("Å", "&Aring;");

    val = val
        .replaceAll("à", "&agrave;")
        .replaceAll("á", "&aacute;")
        .replaceAll("â", "&acirc;")
        .replaceAll("ã", "&atilde;")
        .replaceAll("ä", "&auml;")
        .replaceAll("å", "&aring;")
        .replaceAll("æ", "&aelig;");

    val = val.replaceAll("ç", "&ccedil;").replaceAll("Ç", "&Ccedil;");
    val = val
        .replaceAll("È", "&Egrave;")
        .replaceAll("É", "&Eacute;")
        .replaceAll("Ê", "&Ecirc;")
        .replaceAll("Ë", "&Euml;");

    val = val
        .replaceAll("è", "&egrave;")
        .replaceAll("é", "&eacute;")
        .replaceAll("ê", "&ecirc;")
        .replaceAll("ë", "&euml;");

    val = val
        .replaceAll("Ì", "&Igrave;")
        .replaceAll("Í", "&Iacute;")
        .replaceAll("Î", "&Icirc;")
        .replaceAll("Ï", "&Iuml;");

    val = val
        .replaceAll("ì", "&igrave;")
        .replaceAll("í", "&iacute;")
        .replaceAll("î", "&icirc;")
        .replaceAll("ï", "&iuml;");

    val = val.replaceAll("Ñ", "&Ntilde;");

    val = val
        .replaceAll("Ò", "&Ograve;")
        .replaceAll("Ó", "&Oacute;")
        .replaceAll("Ô", "&Ocirc;")
        .replaceAll("Õ", "&Otilde;")
        .replaceAll("Ö", "&Ouml;");

    val = val
        .replaceAll("ð", "&eth;")
        .replaceAll("ò", "&ograve;")
        .replaceAll("ó", "&oacute;")
        .replaceAll("ô", "&ocirc;")
        .replaceAll("õ", "&otilde;")
        .replaceAll("ö", "&ouml;");

    val = val
        .replaceAll("Ù", "&Ugrave;")
        .replaceAll("Ú", "&Uacute;")
        .replaceAll("Û", "&Ucirc;")
        .replaceAll("Ü", "&Uuml;")
        .replaceAll("Ý", "&Yacute;");

    val = val.replaceAll("ñ", "&ntilde;");

    val = val
        .replaceAll("ù", "&ugrave;")
        .replaceAll("ú", "&uacute;")
        .replaceAll("û", "&ucirc;")
        .replaceAll("ü", "&uuml;");
    val = val.replaceAll("'", "&rsquo;").replaceAll("œ", "&oelig;");

    return val;
  }

  static String UNCODE_UTF_8(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("&amp;", "&")
        .replaceAll("&divide;", "÷")
        .replaceAll("&lt;", ">")
        .replaceAll("&gt;", ">");

    val = val
        .replaceAll("&Agrave;", "À")
        .replaceAll("&Aacute;", "Á")
        .replaceAll("&Acirc;", "Â")
        .replaceAll("&Atilde;", "Ã")
        .replaceAll("&Auml;", "Ä")
        .replaceAll("&Aring;", "Å");

    val = val
        .replaceAll("&agrave;", "à")
        .replaceAll("&aacute;", "á")
        .replaceAll("&acirc;", "â")
        .replaceAll("&atilde;", "ã")
        .replaceAll("&auml;", "ä")
        .replaceAll("&aring;", "å")
        .replaceAll("&aelig;", "æ");

    val = val.replaceAll("&ccedil;", "ç").replaceAll("&Ccedil;", "Ç");

    val = val
        .replaceAll("&Egrave;", "È")
        .replaceAll("&Eacute;", "É")
        .replaceAll("&Ecirc;", "Ê")
        .replaceAll("&Euml;", "Ë");

    val = val
        .replaceAll("&egrave;", "è")
        .replaceAll("&eacute;", "é")
        .replaceAll("&ecirc;", "ê")
        .replaceAll("&euml;", "ë");

    val = val
        .replaceAll("&Igrave;", "Ì")
        .replaceAll("&Iacute;", "Í")
        .replaceAll("&Icirc;", "Î")
        .replaceAll("&Iuml;", "Ï");

    val = val
        .replaceAll("&igrave;", "ì")
        .replaceAll("&iacute;", "í")
        .replaceAll("&icirc;", "î")
        .replaceAll("&iuml;", "ï");

    val = val.replaceAll("&Ntilde;", "Ñ");

    val = val
        .replaceAll("&Ograve;", "Ò")
        .replaceAll("&Oacute;", "Ó")
        .replaceAll("&Ocirc;", "Ô")
        .replaceAll("&Otilde;", "Õ")
        .replaceAll("&Ouml;", "Ö");

    val = val
        .replaceAll("&eth;", "ð")
        .replaceAll("&ograve;", "ò")
        .replaceAll("&oacute;", "ó")
        .replaceAll("&ocirc;", "ô")
        .replaceAll("&otilde;", "õ")
        .replaceAll("&ouml;", "ö");

    val = val
        .replaceAll("&Ugrave;", "Ù")
        .replaceAll("&Uacute;", "Ú")
        .replaceAll("&Ucirc;", "Û")
        .replaceAll("&Uuml;", "Ü")
        .replaceAll("&Yacute;", "Ý");

    val = val.replaceAll("&ntilde;", "ñ").replaceAll("&hellip;", "…");
    val = val.replaceAll("&nbsp;", " ");
    val = val
        .replaceAll("&mdash;", "—")
        .replaceAll("&laquo;", "«")
        .replaceAll("&raquo;", "»")
        .replaceAll("&ndash;", "–");

    val = val
        .replaceAll("&ugrave;", "ù")
        .replaceAll("&uacute;", "ú")
        .replaceAll("&ucirc;", "û")
        .replaceAll("&uuml;", "ü");
    val = val.replaceAll("&rsquo;", "'").replaceAll("&oelig;", "œ");

    return val;
  }

  static String UNCODE_UTF_8_Old(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("&amp;", "&")
        .replaceAll("&lt;", ">")
        .replaceAll("&gt;", ">")
        .replaceAll("&divide;", "÷");

    val = val
        .replaceAll("&Agrave;", "À")
        .replaceAll("&Aacute;", "Á")
        .replaceAll("&Acirc;", "Â")
        .replaceAll("&Atilde;", "Ã")
        .replaceAll("&Auml;", "Ä")
        .replaceAll("&Aring;", "Å");

    val = val
        .replaceAll("&agrave;", "à")
        .replaceAll("&aacute;", "á")
        .replaceAll("&acirc;", "â")
        .replaceAll("&atilde;", "ã")
        .replaceAll("&auml;", "ä")
        .replaceAll("&aring;", "å")
        .replaceAll("&aelig;", "æ");

    val = val.replaceAll("&ccedil;", "ç").replaceAll("&Ccedil;", "Ç");

    val = val
        .replaceAll("&Egrave;", "È")
        .replaceAll("&Eacute;", "É")
        .replaceAll("&Ecirc;", "Ê")
        .replaceAll("&Euml;", "Ë");

    val = val
        .replaceAll("&egrave;", "è")
        .replaceAll("&eacute;", "é")
        .replaceAll("&ecirc;", "ê")
        .replaceAll("&euml;", "ë");

    val = val
        .replaceAll("&Igrave;", "Ì")
        .replaceAll("&Iacute;", "Í")
        .replaceAll("&Icirc;", "Î")
        .replaceAll("&Iuml;", "Ï");

    val = val
        .replaceAll("&igrave;", "ì")
        .replaceAll("&iacute;", "í")
        .replaceAll("&icirc;", "î")
        .replaceAll("&iuml;", "ï");

    val = val.replaceAll("&Ntilde;", "Ñ").replaceAll("&ntilde;", "ñ");
    val = val.replaceAll("&nbsp;", " ");

    val = val
        .replaceAll("&Ograve;", "Ò")
        .replaceAll("&Oacute;", "Ó")
        .replaceAll("&Ocirc;", "Ô")
        .replaceAll("&Otilde;", "Õ")
        .replaceAll("&Ouml;", "Ö");

    val = val
        .replaceAll("&eth;", "ð")
        .replaceAll("&ograve;", "ò")
        .replaceAll("&oacute;", "ó")
        .replaceAll("&ocirc;", "ô")
        .replaceAll("&otilde;", "õ")
        .replaceAll("&ouml;", "ö");

    val = val
        .replaceAll("&Ugrave;", "Ù")
        .replaceAll("&Uacute;", "Ú")
        .replaceAll("&Ucirc;", "Û")
        .replaceAll("&Uuml;", "Ü")
        .replaceAll("&Yacute;", "Ý");

    val = val
        .replaceAll("&ugrave;", "ù")
        .replaceAll("&uacute;", "ú")
        .replaceAll("&ucirc;", "û")
        .replaceAll("&uuml;", "ü");
    val = val.replaceAll("&rsquo;", "'");

    return val;
  }

  static String replaceHtmlBreakAndStrongToSlashN(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("<br />", "\n");
    val = val.replaceAll("</strong>", "\n");
    val = val.replaceAll("<strong>", "");
    return val;
  }

  static String replaceHtmlBreakToSlashN(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("<br />", "\n");
    return val;
  }

  static String ReplaceSlashNToHtmlBreak(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("\n", "<br />");
    val = val.replaceAll("\\r\\n", '<br />');
    val = val.replaceAll("\\n", '<br />');
    return val;
  }
//endregion

  static replaceSpecialChar(String value){
    return value.replaceAll('¶ ', '').replaceAll('¶', '');
  }

  static getChapitre(String value, { int? returnType }){
    if( returnType == null ) {
      return value.toString().split('.').first;
    }
    if( returnType == Constant.stringNew ) {
      return value.toString().split('.').first;
    }
    if( returnType == Constant.intNew ) {
      return int.parse(value.toString().split('.').first);
    }
  }
  static getVerset({double? valueDouble, String? valueString}){
    String vers = '0';
    if( valueDouble!=null) {
      vers = valueDouble.toString().split('.').last;
    }
    if( valueString!=null) {
      vers = valueString.toString().split('.').last;
    }

    if(vers.length<3) {
      return '${int.parse( '${vers}0' )}';
    }//.toString();

    return '${int.parse( vers )}';//.toString();
  }
  static getVerset4Note(String value,{int? position, int? returnType}) { // (Ex. 1.001-005 = Chapitre:1, verset1:001 to verset2:005)
    String vers1 = value.toString().split('.').last; // Ex. 001-005
    //Tools.logCat('01- value::$value | vers1:$vers1');
    String vers = vers1.toString().split('-').first; // Ex. 001
    //Tools.logCat('02- value::$value | vers1:$vers');
    if( position!=null) {
      if (position == Constant.verseBegin) {
        vers = vers1.toString().split('-').first; // Ex. 001
        //Tools.logCat('03- value::$value | vers1:$vers');
      } else if (position == Constant.verseEnd) {
        vers = vers1.toString().split('-').last; // Ex. 005
        //Tools.logCat('04- value::$value | vers1:$vers');
      }
    }
    //Tools.logCat('05- value::$value | vers1:$vers');
    if(vers.length<3) {
      if( returnType == null ) {
        return int.parse('${vers}0').toString();
      }
      if( returnType == Constant.stringNew ) {
        return '${vers}0';
      }
      if( returnType == Constant.intNew ) {
        return int.parse('${vers}0').toString();
      }
    }
    //return int.parse( vers ).toString();
    if( returnType == null ) {
      return int.parse(vers).toString();
    }
    if( returnType == Constant.stringNew ) {
      return vers;
    }
    if( returnType == Constant.intNew ) {
      return int.parse(vers).toString();
    }
  }
}
