
import 'package:brain_dev_tools/config/routes/route_name.dart';
import 'package:brain_dev_tools/views/information-screen/information_screen.dart';
import 'package:get/get.dart';

class RoutesTools
{
  //region [ NAVIGATOR PAGES ]
  static List<GetPage> routes = [
    GetPage(name: RouteNameTools.informationScreen, page: () => InformationScreen(information: Get.parameters[RouteNameTools.pageVar])),
  ];
//endregion
}
