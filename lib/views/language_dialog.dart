import 'package:brain_dev_tools/config/app_config.dart';
import 'package:brain_dev_tools/controllers/localization_controller.dart';
import 'package:brain_dev_tools/models/language_model.dart';
import 'package:brain_dev_tools/tools/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key });

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
                      child: Icon(Icons.language)),
                  Text(
                    'label_Langues'.tr,
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
          //height: 220.0,
          child: GetBuilder<LocalizationController>(builder: (localization) {
            return ListView(
              shrinkWrap: true,
              children: <Widget>[
                for (LanguageModel lang in EnvironmentVariable.appLanguages)
                  ListTile(
                    selected:
                        localization.locale.languageCode == lang.languageCode,
                    leading: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(lang.imageUrl),
                    ),
                    title: Text(lang.languageName.tr),
                    trailing: const Icon(Icons.language),
                    onTap: () {
                      //globalTranslations.setNewLanguage(newLanguage: lang.languageCode);
                      Get.find<LocalizationController>().setLanguage(lang.local);
                      Navigator.pop(context);
                    },
                  ),
                const Divider(),
              ],
            );
          }),
        ));
  }
}

showActionsSettingsLangues() {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return LanguageDialog();
      });
}