// ignore_for_file: constant_identifier_names
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController implements GetxService {
  List<ConnectivityResult>? connectivityResult;
  bool _isInternetOk = true;
  bool get isInternetOk => _isInternetOk;

  // bool _isLoading = true;
  // bool get isLoading => _isLoading;
  // set isLoading(bool val){
  //   _isLoading = val;
  //   update();
  // }
  bool _showProgressBar = true;
  bool get showProgressBar => _showProgressBar;
  set showProgressBar(bool val){
    _showProgressBar = val;
    update();
  }

  ConnectivityController() {
    initData();
  }

  checkWifi() async {
    _isInternetOk = false;
    connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != null) {
      bool connectedToWifi =
          (connectivityResult!.contains(ConnectivityResult.wifi) ||
              connectivityResult!.contains(ConnectivityResult.mobile));
      if (!connectedToWifi) {
        _isInternetOk = false;
        update();
        // WidgetsBinding.instance.addPostFrameCallback((_) => DialogView.showAlertDialogEvent(
        //   title: 'No Internet Connection',
        //   description: 'Please Check Internet Connection',
        //   onPressed: () {
        //     Navigator.pop(Get.context!);
        //     checkWifi();
        //   },
        // ));
      } else {
        _isInternetOk = true;
        update();
      }
    }
  }

  void initData() async {
    _isInternetOk = false;
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _isInternetOk = (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile));
      update();
    });
  }

  setIsInternetOk(bool value) {
    _isInternetOk = value;
    update();
  }
}
