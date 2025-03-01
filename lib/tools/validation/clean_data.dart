// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class CleanData {

  //region [ HTML ]
  static String getTextFromHtml(String htmlText){
    RegExp pattern = RegExp(r'\<[^\>]+\>');
    return htmlText.replaceAll(pattern, "");
  }
  //endregion

  //region [  ]
  static String UTF8_WORD(String sentences ) {
    String val = "";
    val = sentences.replaceAll("à", "a").replaceAll("â", "a").replaceAll("à", "a").replaceAll("å", "a").replaceAll("À", "a").replaceAll("Á", "a").replaceAll("Â", "a").replaceAll("Ã", "a").replaceAll("Ä", "a").replaceAll("Å", "a");
    val = val.replaceAll("é", "e").replaceAll("è", "e").replaceAll("ê", "e").replaceAll("ë", "e").replaceAll("È", "e").replaceAll("É", "e").replaceAll("ē", "e").replaceAll("Ē", "e").replaceAll("Ë", "e").replaceAll("Ê", "e");
    val = val.replaceAll("ò", "o").replaceAll("ó", "o").replaceAll("ô", "o").replaceAll("õ", "o").replaceAll("ö", "o").replaceAll("Ò", "o").replaceAll("Ó", "o").replaceAll("Ô", "o").replaceAll("Õ", "o").replaceAll("Ö", "o");
    val = val.replaceAll("ï", "i").replaceAll("ì", "i").replaceAll("í", "i").replaceAll("î", "i").replaceAll(",", "").replaceAll("&", "");
    val = val.replaceAll("ù", "u").replaceAll("ú", "u").replaceAll("û", "u").replaceAll("ü", "u").replaceAll(".", "").replaceAll("%", "").replaceAll("#", "").replaceAll("@", "");
    //val = val/*.replaceAll("$", "")*/;
    val = val.replaceAll("æ", "").replaceAll("↔", "");
    val = val.replaceAll("'", "").replaceAll("ç", "c").replaceAll("+", "").replaceAll("*", "").replaceAll("\\", "");
    val = val.replaceAll("/", "").replaceAll("(", "").replaceAll(")", "").replaceAll("{", "").replaceAll("}", "").replaceAll("[", "").replaceAll("]", "").replaceAll("|", "");
    val = val.replaceAll("<", "").replaceAll(">", "").replaceAll("   ", " ").replaceAll("  ", " ").replaceAll(" ", "_").replaceAll("\"", "").replaceAll("^", "").replaceAll("`", "").replaceAll("~", "").replaceAll("!", "");
    val = val.replaceAll(":", "").replaceAll("-", "").replaceAll("’", "");
    return val;
  }

  static String UnCodeSpecialChar(String Sentences) {
    String val  = "";
    val = Sentences.replaceAll("à", "a").replaceAll("â", "a").replaceAll("à", "a").replaceAll("å", "a").replaceAll("À", "a").replaceAll("Á", "a").replaceAll("Â", "a").replaceAll("Ã", "a").replaceAll("Ä", "a").replaceAll("Å", "a");
    val = val.replaceAll("é", "e").replaceAll("è", "e").replaceAll("ê", "e").replaceAll("ë", "e").replaceAll("È", "e").replaceAll("É", "e").replaceAll("ē", "e").replaceAll("Ē", "e").replaceAll("Ë", "e").replaceAll("Ê", "e");
    val = val.replaceAll("ò", "o").replaceAll("ó", "o").replaceAll("ô", "o").replaceAll("õ", "o").replaceAll("ö", "o").replaceAll("Ò", "o").replaceAll("Ó", "o").replaceAll("Ô", "o").replaceAll("Õ", "o").replaceAll("Ö", "o");
    val = val.replaceAll("ï", "i").replaceAll("ì", "i").replaceAll("í", "i").replaceAll("î", "i");
    val = val.replaceAll("ù", "u").replaceAll("ú", "u").replaceAll("û", "u").replaceAll("ü", "u");
    val = val.replaceAll("ç", "c");
    return val;
  }

  static String DECODE_UTF_8(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("&", "&amp;").replaceAll("÷", "&divide;");//.replaceAll(">", "&lt;").replaceAll(">", "&gt;");

    val = val.replaceAll("À", "&Agrave;").replaceAll("Á", "&Aacute;").replaceAll("Â", "&Acirc;").replaceAll("Ã", "&Atilde;").replaceAll("Ä", "&Auml;").replaceAll("Å", "&Aring;");

    val = val.replaceAll("à", "&agrave;").replaceAll("á", "&aacute;").replaceAll("â", "&acirc;").replaceAll("ã", "&atilde;").replaceAll("ä", "&auml;").replaceAll("å", "&aring;").replaceAll("æ", "&aelig;");

    val = val.replaceAll("ç", "&ccedil;").replaceAll("Ç", "&Ccedil;");
    val = val.replaceAll("È", "&Egrave;").replaceAll("É", "&Eacute;").replaceAll("Ê", "&Ecirc;").replaceAll("Ë", "&Euml;");

    val = val.replaceAll("è", "&egrave;").replaceAll("é", "&eacute;").replaceAll("ê", "&ecirc;").replaceAll("ë", "&euml;");

    val = val.replaceAll("Ì", "&Igrave;").replaceAll("Í", "&Iacute;").replaceAll("Î", "&Icirc;").replaceAll("Ï", "&Iuml;");

    val = val.replaceAll("ì", "&igrave;").replaceAll("í", "&iacute;").replaceAll("î", "&icirc;").replaceAll("ï", "&iuml;");

    val = val.replaceAll("Ñ", "&Ntilde;");

    val = val.replaceAll( "Ò", "&Ograve;").replaceAll( "Ó","&Oacute;").replaceAll( "Ô","&Ocirc;").replaceAll( "Õ","&Otilde;").replaceAll( "Ö","&Ouml;");

    val = val.replaceAll( "ð","&eth;").replaceAll( "ò","&ograve;").replaceAll( "ó","&oacute;").replaceAll( "ô","&ocirc;").replaceAll( "õ","&otilde;").replaceAll( "ö","&ouml;");

    val = val.replaceAll( "Ù","&Ugrave;").replaceAll( "Ú","&Uacute;").replaceAll( "Û","&Ucirc;").replaceAll( "Ü","&Uuml;").replaceAll( "Ý","&Yacute;");

    val = val.replaceAll( "ñ","&ntilde;");

    val = val.replaceAll( "ù","&ugrave;").replaceAll( "ú","&uacute;").replaceAll( "û","&ucirc;").replaceAll( "ü","&uuml;");
    val = val.replaceAll("'", "&rsquo;").replaceAll("œ", "&oelig;");

    return val;
  }

  static String UNCODE_UTF_8(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("&amp;", "&").replaceAll("&divide;", "÷").replaceAll("&lt;", ">").replaceAll("&gt;", ">");

    val = val.replaceAll("&Agrave;", "À").replaceAll("&Aacute;", "Á").replaceAll("&Acirc;", "Â").replaceAll("&Atilde;", "Ã").replaceAll("&Auml;", "Ä").replaceAll("&Aring;", "Å");

    val = val.replaceAll("&agrave;", "à").replaceAll("&aacute;", "á").replaceAll("&acirc;", "â").replaceAll("&atilde;", "ã").replaceAll("&auml;", "ä").replaceAll("&aring;", "å").replaceAll("&aelig;", "æ");

    val = val.replaceAll("&ccedil;", "ç").replaceAll("&Ccedil;", "Ç");

    val = val.replaceAll("&Egrave;", "È").replaceAll("&Eacute;", "É").replaceAll("&Ecirc;", "Ê").replaceAll("&Euml;", "Ë");

    val = val.replaceAll("&egrave;", "è").replaceAll("&eacute;", "é").replaceAll("&ecirc;", "ê").replaceAll("&euml;", "ë");

    val = val.replaceAll("&Igrave;", "Ì").replaceAll("&Iacute;", "Í").replaceAll("&Icirc;", "Î").replaceAll("&Iuml;", "Ï");

    val = val.replaceAll("&igrave;", "ì").replaceAll("&iacute;", "í").replaceAll("&icirc;", "î").replaceAll("&iuml;", "ï");

    val = val.replaceAll("&Ntilde;", "Ñ");

    val = val.replaceAll("&Ograve;", "Ò").replaceAll("&Oacute;", "Ó").replaceAll("&Ocirc;", "Ô").replaceAll("&Otilde;", "Õ").replaceAll("&Ouml;", "Ö");

    val = val.replaceAll("&eth;", "ð").replaceAll("&ograve;", "ò").replaceAll("&oacute;", "ó").replaceAll("&ocirc;", "ô").replaceAll("&otilde;", "õ").replaceAll("&ouml;", "ö");

    val = val.replaceAll("&Ugrave;", "Ù").replaceAll("&Uacute;", "Ú").replaceAll("&Ucirc;", "Û").replaceAll("&Uuml;", "Ü").replaceAll("&Yacute;", "Ý");

    val = val.replaceAll("&ntilde;", "ñ").replaceAll("&hellip;", "…");
    val = val.replaceAll("&nbsp;", " ");
    val = val.replaceAll("&mdash;", "—").replaceAll("&laquo;", "«").replaceAll("&raquo;", "»").replaceAll("&ndash;", "–");

    val = val.replaceAll("&ugrave;", "ù").replaceAll("&uacute;", "ú").replaceAll("&ucirc;", "û").replaceAll("&uuml;", "ü");
    val = val.replaceAll("&rsquo;", "'").replaceAll("&oelig;", "œ");

    return val;
  }

  static String UNCODE_UTF_8_Old(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("&amp;", "&").replaceAll("&lt;", ">").replaceAll("&gt;", ">").replaceAll("&divide;", "÷");

    val = val.replaceAll("&Agrave;", "À").replaceAll("&Aacute;", "Á").replaceAll("&Acirc;", "Â").replaceAll("&Atilde;", "Ã").replaceAll("&Auml;", "Ä").replaceAll("&Aring;", "Å");

    val = val.replaceAll("&agrave;", "à").replaceAll("&aacute;", "á").replaceAll("&acirc;", "â").replaceAll("&atilde;", "ã").replaceAll("&auml;", "ä").replaceAll("&aring;", "å").replaceAll("&aelig;", "æ");

    val = val.replaceAll("&ccedil;", "ç").replaceAll("&Ccedil;", "Ç");

    val = val.replaceAll("&Egrave;", "È").replaceAll("&Eacute;", "É").replaceAll("&Ecirc;", "Ê").replaceAll("&Euml;", "Ë");

    val = val.replaceAll("&egrave;", "è").replaceAll("&eacute;", "é").replaceAll("&ecirc;", "ê").replaceAll("&euml;", "ë");

    val = val.replaceAll("&Igrave;", "Ì").replaceAll("&Iacute;", "Í").replaceAll("&Icirc;", "Î").replaceAll("&Iuml;", "Ï");

    val = val.replaceAll("&igrave;", "ì").replaceAll("&iacute;", "í").replaceAll("&icirc;", "î").replaceAll("&iuml;", "ï");

    val = val.replaceAll("&Ntilde;", "Ñ").replaceAll("&ntilde;", "ñ");
    val = val.replaceAll("&nbsp;", " ");

    val = val.replaceAll("&Ograve;", "Ò").replaceAll("&Oacute;", "Ó").replaceAll("&Ocirc;", "Ô").replaceAll("&Otilde;", "Õ").replaceAll("&Ouml;", "Ö");

    val = val.replaceAll("&eth;", "ð").replaceAll("&ograve;", "ò").replaceAll("&oacute;", "ó").replaceAll("&ocirc;", "ô").replaceAll("&otilde;", "õ").replaceAll("&ouml;", "ö");

    val = val.replaceAll("&Ugrave;", "Ù").replaceAll("&Uacute;", "Ú").replaceAll("&Ucirc;", "Û").replaceAll("&Uuml;", "Ü").replaceAll("&Yacute;", "Ý");

    val = val.replaceAll("&ugrave;", "ù").replaceAll("&uacute;", "ú").replaceAll("&ucirc;", "û").replaceAll("&uuml;", "ü");
    val = val.replaceAll("&rsquo;", "'");

    return val;
  }

  static String ReplaceHtmlBreakAndStrongToSlashN(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("<br />", "\n");
    val = val.replaceAll("</strong>", "\n");
    val = val.replaceAll("<strong>", "");
    return val;
  }

  static String ReplaceHtmlBreakToSlashN(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("<br />", "\n");
    val = val.replaceAll("<br>", "\n");
    val = val.replaceAll("<br/>", "\n");
    return val;
  }

  static String ReplaceSlashNToHtmlBreak(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("\n", "<br />");
    return val;
  }

  static String ReplaceSlashNAndHtmlBreak(String Sentences) {
    String val = "";
    val = Sentences.replaceAll("\n", "");
    val = val.replaceAll("<br />", "");
    val = val.replaceAll(" ", "");
    return val;
  }
//endregion
}