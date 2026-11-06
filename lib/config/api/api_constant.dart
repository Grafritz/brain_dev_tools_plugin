import 'package:brain_dev_tools/config/app_config.dart';

/// Adresses communes aux plugins. **Le Middleware LyricStream est la seule origine** : l'ancienne API (`api.ccg.*`) n'est
/// plus référencée (décision 15 du 2026-11-02).
class ApiConstantDev {
  // pagination settings
  // the number of recipes to load per page
  static const perPage = 10;

  /// Origine du Middleware LyricStream (avec « / » final).
  static String get urlMiddleware => EnvironmentVariable.urlMiddlewareServer;

  /// Mon compte : `GET` lit mon profil, `DELETE` supprime mon compte et mes données privées.
  static String get urlMiddlewareMe => '${urlMiddleware}api/users/me';

  /// `PUT` : met à jour mon profil.
  static String get urlMiddlewareMyProfile => '$urlMiddlewareMe/profile';

  /// Appareils (jetons FCM) de l'utilisateur connecté : `PUT` enregistre ou renouvelle, `DELETE /<jeton>` retire.
  static String get urlMiddlewareDevices => '${urlMiddleware}api/notifications/devices';

  /// Réglages publics (politique de confidentialité, conditions d'utilisation).
  static String get urlMiddlewareSettings => '${urlMiddleware}api/settings';

  /// Fiche de version d'une application (`GET`, public). [platform] (`android` ou `ios`) choisit la fiche de la
  /// plateforme : une mise à jour d'une seule plateforme ne doit pas toucher l'autre. Sans plateforme (ou vide), le
  /// serveur renvoie la fiche « toutes plateformes », celle que lisent aussi les versions déjà installées.
  static String urlMiddlewareAppVersion({required String packageName, String? platform}) {
    final base = '${urlMiddleware}api/app-versions/${Uri.encodeComponent(packageName)}';
    return (platform == null || platform.isEmpty) ? base : '$base?platform=${Uri.encodeQueryComponent(platform)}';
  }

  /// Image d'une notification : une adresse absolue est gardée telle quelle ; un nom de fichier relatif (ancien stockage
  /// du site historique) n'a plus d'équivalent et donne une adresse vide.
  static String notificationImageUrl(String image) => image.startsWith('http') ? image : '';
}
