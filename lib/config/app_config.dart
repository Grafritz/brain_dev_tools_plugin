// ignore_for_file: constant_identifier_names
import 'package:brain_dev_tools/I10n/l10n.dart';
import 'package:brain_dev_tools/config/I10n/assets_locale_l10n.dart';
import 'package:brain_dev_tools/config/api/api_variables.dart';
import 'package:brain_dev_tools/models/language_model.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class SetUpEnvironment
{
  static dev({ required AppConfig appConfig }) {
    FlavorConfig(
        name: ApiVariables.DEV,
        color: Colors.amber,
        location: BannerLocation.topStart,
        variables: variableData(appConfig: appConfig)
    );
  }

  static qa({ required AppConfig appConfig }) {
    FlavorConfig(
        name: ApiVariables.QA,
        color: Colors.red,
        location: BannerLocation.topStart,
        variables: variableData(appConfig: appConfig)
    );
  }

  static prod({ required AppConfig appConfig }) {
    FlavorConfig(
        name: ApiVariables.PROD,
        color: Colors.teal,
        location: BannerLocation.topStart,
        variables: variableData(appConfig: appConfig)
    );
  }

  static Map<String, dynamic> variableData({ required AppConfig appConfig }) => {
    ApiVariables.appName: appConfig.appName,
    ApiVariables.appImage: appConfig.appImage,
    ApiVariables.appLanguages: appConfig.appLanguages,
    ApiVariables.assetsPathLanguage: appConfig.assetsPathLanguage,
    ApiVariables.assetsPathLanguageToMerge: appConfig.assetsPathLanguageToMerge,
    ApiVariables.urlWebServer: appConfig.urlWebServer,
    ApiVariables.urlApiServer: appConfig.urlApiServer,
    ApiVariables.environmentType: appConfig.enumEnvironmentType,
    ApiVariables.templateLogin: appConfig.templateLogin,
    ApiVariables.isConnectionRequired: appConfig.isConnectionRequired,
    ApiVariables.isBibleActive: appConfig.isBibleActive,
    ApiVariables.endPointApi: appConfig.endPointApi,
    ApiVariables.googleAds: appConfig.googleAds,
    ApiVariables.firebaseOptions: appConfig.firebaseOptions,
  };
}

class EnvironmentVariable
{
  static String get name => FlavorConfig.instance.name??'';
  static String get appName => flavorConfigVariables(variableName: ApiVariables.appName);
  static ImageModel get appImage => flavorConfigVariables(variableName: ApiVariables.appImage);
  static List<LanguageModel> get appLanguages => flavorConfigVariables(variableName: ApiVariables.appLanguages);
  static String get assetsPathLanguage => flavorConfigVariables(variableName: ApiVariables.assetsPathLanguage);
  static String get assetsPathLanguageToMerge => flavorConfigVariables(variableName: ApiVariables.assetsPathLanguageToMerge);
  static String get urlWebServer => flavorConfigVariables(variableName: ApiVariables.urlWebServer);
  static String get urlApiServer => flavorConfigVariables(variableName: ApiVariables.urlApiServer);
  static EnumEnvironmentType get environmentType => flavorConfigVariables(variableName: ApiVariables.environmentType);
  static bool get isConnectionRequired => flavorConfigVariables(variableName: ApiVariables.isConnectionRequired);
  static bool get isBibleActive => flavorConfigVariables(variableName: ApiVariables.isBibleActive);
  static EnumTemplateLogin get templateLogin => flavorConfigVariables(variableName: ApiVariables.templateLogin);
  static EndPointApiModel get endPointApi => flavorConfigVariables(variableName: ApiVariables.endPointApi);
  static GoogleAdsModel get googleAds => flavorConfigVariables(variableName: ApiVariables.googleAds);
  static Map<String, Map<String, String>> get appTranslator => AssetsLocaleL10n.appTranslator();
  static dynamic get firebaseOptions => flavorConfigVariables(variableName: ApiVariables.firebaseOptions);

  static flavorConfigVariables({required String variableName}){
    return FlavorConfig.instance.variables[variableName];
  }
}

class AppConfig
{
  String appName;
  String urlWebServer;
  String urlApiServer;
  ImageModel appImage;
  EnumEnvironmentType enumEnvironmentType;
  EnumTemplateLogin templateLogin;// = EnumTemplateLogin.template1;
  bool isConnectionRequired=true;
  bool isBibleActive=false;
  EndPointApiModel endPointApi;
  GoogleAdsModel googleAds;
  List<LanguageModel> appLanguages = L10n.languages_en_fr_es_ht;
  String assetsPathLanguage='assets/locale';
  String assetsPathLanguageToMerge='';
  dynamic firebaseOptions;

  AppConfig({
    required this.appName,
    required this.appImage,
    required this.appLanguages,
    this.assetsPathLanguage='assets/locale',
    this.assetsPathLanguageToMerge='',
    required this.urlWebServer,
    required this.urlApiServer,
    required this.enumEnvironmentType,
    this.isConnectionRequired=true,
    this.isBibleActive=false,
    required this.endPointApi,
    required this.googleAds,
    this.templateLogin = EnumTemplateLogin.template1,
    this.firebaseOptions
  });
}

class GoogleAdsModel
{
  //Android
  String? appIdAdMobAndroid;
  String? appOpenAdMobAndroid;
  String? bannerAdMobAndroid;
  String? interstitielAdMobAndroid;
  String? rewardedAdMobAndroid;
  String? rewardedInterstitielAdMobAndroid;
  String? natifAdvancedAdMobAndroid;
  //iOS
  String? appIdAdMobIOS;
  String? appOpenAdMobIOS;
  String? bannerAdMobIOS;
  String? interstitielAdMobIOS;
  String? rewardedAdMobIOS;
  String? rewardedInterstitielAdMobIOS;
  String? natifAdvancedAdMobIOS;

  GoogleAdsModel({
    //Android
    this.appIdAdMobAndroid,
    this.appOpenAdMobAndroid,
    this.bannerAdMobAndroid,
    this.interstitielAdMobAndroid,
    this.rewardedAdMobAndroid,
    this.rewardedInterstitielAdMobAndroid,
    this.natifAdvancedAdMobAndroid,
    //iOS
    this.appIdAdMobIOS,
    this.appOpenAdMobIOS,
    this.bannerAdMobIOS,
    this.interstitielAdMobIOS,
    this.rewardedAdMobIOS,
    this.rewardedInterstitielAdMobIOS,
    this.natifAdvancedAdMobIOS,
  });

  factory GoogleAdsModel.fromJson(Map<String, dynamic> map) {
    GoogleAdsModel obj = GoogleAdsModel();
    //Android
    obj.appIdAdMobAndroid = TypeSafeConversion.nullSafeString(map['appIdAdMobAndroid']);
    obj.appOpenAdMobAndroid = TypeSafeConversion.nullSafeString(map['appOpenAdMobAndroid']);
    obj.bannerAdMobAndroid = TypeSafeConversion.nullSafeString(map['bannerAdMobAndroid']);
    obj.interstitielAdMobAndroid = TypeSafeConversion.nullSafeString(map['interstitielAdMobAndroid']);
    obj.rewardedAdMobAndroid = TypeSafeConversion.nullSafeString(map['rewardedAdMobAndroid']);
    obj.rewardedInterstitielAdMobAndroid = TypeSafeConversion.nullSafeString(map['rewardedInterstitielAdMobAndroid']);
    obj.natifAdvancedAdMobAndroid = TypeSafeConversion.nullSafeString(map['natifAdvancedAdMobAndroid']);
    //iOS
    obj.appIdAdMobIOS = TypeSafeConversion.nullSafeString(map['appIdAdMobIOS']);
    obj.appOpenAdMobIOS = TypeSafeConversion.nullSafeString(map['appOpenAdMobIOS']);
    obj.bannerAdMobIOS = TypeSafeConversion.nullSafeString(map['bannerAdMobIOS']);
    obj.interstitielAdMobIOS = TypeSafeConversion.nullSafeString(map['interstitielAdMobIOS']);
    obj.rewardedAdMobIOS = TypeSafeConversion.nullSafeString(map['rewardedAdMobIOS']);
    obj.rewardedInterstitielAdMobIOS = TypeSafeConversion.nullSafeString(map['rewardedInterstitielAdMobIOS']);
    obj.natifAdvancedAdMobIOS = TypeSafeConversion.nullSafeString(map['natifAdvancedAdMobIOS']);
    return obj;
  }

  Map<String, dynamic> toJson() => {
  //Android
  'appIdAdMobAndroid': appIdAdMobAndroid,
  'appOpenAdMobAndroid': appOpenAdMobAndroid,
  'bannerAdMobAndroid': bannerAdMobAndroid,
  'interstitielAdMobAndroid': interstitielAdMobAndroid,
  'rewardedAdMobAndroid': rewardedAdMobAndroid,
  'rewardedInterstitielAdMobAndroid': rewardedInterstitielAdMobAndroid,
  'natifAdvancedAdMobAndroid': natifAdvancedAdMobAndroid,
  //iOS
  'appIdAdMobIOS': appIdAdMobIOS,
  'appOpenAdMobIOS': appOpenAdMobIOS,
  'bannerAdMobIOS': bannerAdMobIOS,
  'interstitielAdMobIOS': interstitielAdMobIOS,
  'rewardedAdMobIOS': rewardedAdMobIOS,
  'rewardedInterstitielAdMobIOS': rewardedInterstitielAdMobIOS,
  'natifAdvancedAdMobIOS': natifAdvancedAdMobIOS,
  };
}

class ImageModel
{
  String logoCircleLight;
  String? logoCircleDark;
  String? logoSquareLight;
  String? logoSquareDark;
  String? bgImageLight;
  String? bgImageDark;

  ImageModel({
    required this.logoCircleLight,
    this.logoCircleDark,
    this.logoSquareLight,
    this.logoSquareDark,
    this.bgImageLight,
    this.bgImageDark,
  });

  factory ImageModel.fromJson(Map<String, dynamic> map) {
    ImageModel obj = ImageModel(logoCircleLight: TypeSafeConversion.nullSafeString(map['logoCircleLight']));
    obj.logoCircleDark = TypeSafeConversion.nullSafeString(map['logoCircleDark']);
    obj.logoSquareLight = TypeSafeConversion.nullSafeString(map['logoSquareLight']);
    obj.logoSquareDark = TypeSafeConversion.nullSafeString(map['logoSquareDark']);
    obj.bgImageLight = TypeSafeConversion.nullSafeString(map['bgImageLight']);
    obj.bgImageDark = TypeSafeConversion.nullSafeString(map['bgImageDark']);
    return obj;
  }

  Map<String, dynamic> toJson() => {
    'logoCircleLight': logoCircleLight,
    'logoCircleDark': logoCircleDark,
    'logoSquareLight': logoSquareLight,
    'logoSquareDark': logoSquareDark,
    'bgImageLight': bgImageLight,
    'bgImageDark': bgImageDark,
  };
}

class EndPointApiModel
{
  String user;
  String login;
  String register;
  String forgetPassword;
  String settings;
  String autoAuthenticate;
  String deviceToken;
  String setDeviceToken;
  String refreshDeviceToken;

  EndPointApiModel({
    this.user               = '/api/v1/user',
    this.login              = '/api/v1/user/login-register-provider',
    this.register           = '/api/v1/user/register',
    this.autoAuthenticate   = '/api/v1/user/auto-authenticate',
    this.forgetPassword     = '/api/v1/user/',
    this.settings           = '/api/v1/Settings',
    this.deviceToken        = '/api/v1/deviceToken',
    this.setDeviceToken     = '/api/v1/deviceToken/setDeviceToken',
    this.refreshDeviceToken = '/api/v1/deviceToken/refreshDeviceToken',
  });

  factory EndPointApiModel.fromJson(Map<String, dynamic> map) {
    EndPointApiModel obj = EndPointApiModel();
    obj.user = TypeSafeConversion.nullSafeString(map['user']);
    obj.login = TypeSafeConversion.nullSafeString(map['login']);
    obj.register = TypeSafeConversion.nullSafeString(map['register']);
    obj.forgetPassword = TypeSafeConversion.nullSafeString(map['forgetPassword']);
    obj.settings = TypeSafeConversion.nullSafeString(map['settings']);
    obj.autoAuthenticate = TypeSafeConversion.nullSafeString(map['autoAuthenticate']);
    obj.deviceToken = TypeSafeConversion.nullSafeString(map['deviceToken']);
    obj.setDeviceToken = TypeSafeConversion.nullSafeString(map['setDeviceToken']);
    obj.refreshDeviceToken = TypeSafeConversion.nullSafeString(map['refreshDeviceToken']);
    return obj;
  }

  Map<String, dynamic> toJson() => {
    'user': user,
    'login': login,
    'register': register,
    'forgetPassword': forgetPassword,
    'settings': settings,
    'autoAuthenticate': autoAuthenticate,
    'deviceToken': deviceToken,
    'setDeviceToken': setDeviceToken,
    'refreshDeviceToken': refreshDeviceToken,
  };
}