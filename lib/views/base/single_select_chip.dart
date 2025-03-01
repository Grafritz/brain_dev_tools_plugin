import 'package:brain_dev_tools/controllers/application_controller.dart';
import 'package:brain_dev_tools/models/language_model.dart';
import 'package:brain_dev_tools/tools/layout/custom_text_form_field.dart';
import 'package:brain_dev_tools/tools/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleSelectChip extends StatefulWidget {
  final List? data;
  final Function(String)? onSelectionChanged;

  const SingleSelectChip({super.key, this.data, this.onSelectionChanged});

  @override
  State<SingleSelectChip> createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<SingleSelectChip> {
  String selectedChoice = '';

  buildChoiceList() {
    List<Widget> choices = [];
    widget.data?.forEach((c) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          avatar: (c is LangueModel)
              ? Text(c.flag, style: const TextStyle(fontSize: 20))
              : null,
          label: Text('${c.nameDefault}'.tr),
          selected: selectedChoice == c.id.toString(),
          selectedColor: Theme.of(context).primaryColor,
          onSelected: (selected) {
            setState(() {
              selectedChoice = c.id.toString();
              if (widget.onSelectionChanged != null) {
                widget.onSelectionChanged!(selectedChoice);
              }
            });
          },
        ),
      ));
    });
    return choices;
  }

  contentData() {
    return SizedBox(
      width: double.maxFinite,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[Wrap(children: buildChoiceList())],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return contentData();
    // return Wrap(
    //   children: buildChoiceList(),
    // );
  }
}

showOptionPicker({
  required String text,
  List? data,
  bool showSearchButton = true,
  TextEditingController? controller,
  Function? onSelectedChanged,
  Function? onDonePressed,
})
{
  Get.find<ApplicationController>().dataResult = data;
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: GetBuilder<ApplicationController>(builder: (applicationCtr) {
          return Row(
            children: <Widget>[
              if (!applicationCtr.showSearch) Expanded(child: Text(text)),
              if (applicationCtr.showSearch)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: CustomTextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      labelText: 'nav_Recherche'.tr,
                      hintText: 'nav_RechercheHint'.tr,
                      onChanged: (String? value) {
                        if (data != null) {
                          //if (data is List<LangueModel>) {
                          //logCat('A:${(data is LangueModel)}');
                          //logCat('T:${(data is List<LangueModel>)}');
                          applicationCtr.dataResult = data
                              .where((x) =>
                                  x.name
                                      ?.toLowerCase()
                                      .contains(value?.toLowerCase()) ||
                                  x.value
                                      ?.toLowerCase()
                                      .contains(value?.toLowerCase()))
                              .toList();
                          //}
                        }
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'msg_required'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              if (!applicationCtr.showSearch && showSearchButton)
                IconButton(
                    icon: const Icon(Icons.search),
                    color: ColorResources.getColor(color: Colors.black),
                    onPressed: () {
                      applicationCtr.showSearch = !applicationCtr.showSearch;
                    }),
              if (applicationCtr.showSearch && !showSearchButton)
                IconButton(
                    icon: const Icon(Icons.close),
                    color: ColorResources.getColor(color: Colors.black),
                    onPressed: () {
                      applicationCtr.showSearch = false;
                      Navigator.pop(context);
                    }),
            ],
          );
        }),
        titlePadding:
            const EdgeInsets.only(left: 10.0, right: 0.0, top: 0, bottom: 0),
        contentPadding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
        content: GetBuilder<ApplicationController>(builder: (applicationCtr) {
          return SingleSelectChip(
            data: applicationCtr.dataResult,
            onSelectionChanged: (selected) => onSelectedChanged!(selected),
          );
        }),
        actions: <Widget>[
          TextButton(
            child: Text("done".tr),
            onPressed: () => onDonePressed!(),
          ),
        ],
      );
    },
  );
}
