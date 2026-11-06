// Le journal vit dans `brain_dev_core` (les plugins l'utilisent sans dépendre de `tools`) ; ce fichier le ré-exporte
// pour que `package:brain_dev_tools/tools/tools_log.dart` continue de fonctionner (`logCat`, `logError`, `println`, `tag`).
export 'package:brain_dev_core/log/brain_dev_log.dart';
