
import 'package:brain_dev_tools/controllers/theme_controller.dart';
import 'package:brain_dev_tools/tools/my_colors.dart';
import 'package:brain_dev_tools/tools/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorThemeDialog extends StatelessWidget {
  const ColorThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.1, 0.8],
                    colors: [Theme.of(context).primaryColor, Colors.black]),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.color_lens)),
                  Text(
                    'label_Couleur_Theme'.tr,
                    style: TextStyle(color: ColorResources.getColor()),
                  ),
                  const Spacer(),
                  Icon(Icons.close, color: ColorResources.getColor())
                ],
              )),
        ),
        titlePadding:
        const EdgeInsets.only(left: 0.0, right: 0.0, top: 0, bottom: 0),
        contentPadding:
        const EdgeInsets.only(left: 0.0, right: 0.0, top: 0, bottom: 0),
        content: SizedBox(
          width: double.maxFinite,
          height: 300.0,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: MyColors.primaryColor.length,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundColor: MyColors.primaryColor[i],
                      child: const Icon(
                        Icons.format_paint_outlined,
                        color: Colors.black,
                      )),
                  // leading: Container(
                  //   decoration: BoxDecoration( borderRadius: BorderRadius.circular(20), color: MyColors.primaryColor[i],),
                  //   width: 34, height: 34,),
                  title: Text(
                    MyColors.primaryColorStr[i].toString().toUpperCase(),
                  ),
                  trailing: const Icon(Icons.color_lens),
                  onTap: () {
                    //var _primarySwatch = MyColors.primaryColor[i];
                    Get.find<ThemeController>().setColorTheme(i);
                    // setState(() {
                    //   //globalSessionPref.setPrimaryColorSwatch(i);
                    //   //FlutterDynamicTheme.of(context)?.setThemeData(ThemeData(primarySwatch: _primarySwatch, ));
                    // });
                    Navigator.pop(context, MyColors.primaryColor[i]);
                  },
                );
              }),
        ));
  }
}

