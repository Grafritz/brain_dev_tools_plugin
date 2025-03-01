
import 'package:brain_dev_tools/data/langue_md.dart';
import 'package:brain_dev_tools/models/language_model.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:get/get.dart';

class LangueController extends GetxController implements GetxService {
  LangueController() {
    getLangueList();
    //getStatutList();
  }

  //region [ ATTRIBUTS ]
  List<LangueModel> _langues = [];

  List<LangueModel> get langues => _langues;

  // List<LangueModel> _statusPublish = [];
  // List<LangueModel> get statusPublish => _statusPublish;

  bool _showProgressBar = false;

  bool get showProgressBar => _showProgressBar;

  //endregion

  showDialogProgress({bool show = true}) {
    _showProgressBar = show;
    update();
  }

  Future getLangueList() async {
    if (_langues.isNotEmpty) {
      return;
    }
    _getLangueList();
  }

  _getLangueList() {
    try {
      showDialogProgress();
      _langues = LangueModel.fromJsonList(LANGUES_DATA);
    } catch (ex, trace) {
      logError(ex, trace: trace);
    }
    showDialogProgress(show: false);
    update();
  }
}
