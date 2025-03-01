import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleSelectDialog extends StatefulWidget {
  const SingleSelectDialog({
    super.key,
    //required this.text,
    //this.controller,
    this.data,
    this.onSelectedChanged,
    //this.onDonePressed
  });

  //final String text;
  final List? data;

  //final TextEditingController? controller;
  final Function(String)? onSelectedChanged;

  //final Function? onDonePressed;

  @override
  State<SingleSelectDialog> createState() => _SingleSelectDialogState();
}

class _SingleSelectDialogState extends State<SingleSelectDialog> {
  bool showSearch = false;
  String selectedChoice = '';

  /*titleBar() {
    return Row(
      children: <Widget>[
        if( !showSearch )
          Expanded(child: Text(widget.text)),

        if( showSearch )
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: CustomTextFormField(
                keyboardType: TextInputType.text,
                //controller: tec_position,
                //maxLength: 5,
                //autofocus: true,
                labelText: 'nav_Recherche'.tr,
                hintText: 'nav_RechercheHint'.tr,
                onChanged: (String? value) {
                  //this.chantUser.position = value ?? '';
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return '${'msg_required'.tr}';
                  }
                  return null;
                },
              ),
            ),
          ),

        if( !showSearch )
          IconButton(icon: const Icon(Icons.search),
              color: ColorResources.getColor(color: Colors.black),
              onPressed: () =>
                  setState(() {
                    showSearch = !showSearch;
                  })),

        if( showSearch )
          IconButton(icon: const Icon(Icons.close),
              color: ColorResources.getColor(color: Colors.black),
              onPressed: () => Navigator.pop(context)),
      ],
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return contentData();
  }

  contentData() {
    return SizedBox(
      width: double.maxFinite,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Wrap(
            children: buildChoiceList(),
          )
        ],
      ),
    );
  }

  buildChoiceList() {
    List<Widget> choices = [];
    widget.data?.forEach((c) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          avatar: Text(c.flag),
          label: Text(c.nameDefault),
          selected: selectedChoice == c.id.toString(),
          selectedColor: Theme.of(context).primaryColor,
          onSelected: (selected) {
            setState(() {
              selectedChoice = c.id.toString();
              if (widget.onSelectedChanged != null) {
                widget.onSelectedChanged!(selectedChoice);
              }
            });
          },
        ),
      ));
    });
    return choices;
  }

/*actionButtons() {
    return <Widget>[
      TextButton(
        child: Text('done'.tr),
        onPressed: widget.onDonePressed!=null? widget.onDonePressed!():() {Navigator.pop(context);},
      ),

    ];
  }*/
}

singleSelectChip({
  required String text,
  List? data,
  TextEditingController? controller,
  Function? onDonePressed,
  void Function(String)? onSelectedChanged,
}) async
{
  return showDialog(
      context: Get.context!,
      //barrierDismissible: true,
      builder: (BuildContext context) {
        //ApplicationController applicationController = Get.find<ApplicationController>();
        return AlertDialog(
          title: Text(text),
          // Row(
          //   children: <Widget>[
          //     //if( !showSearch )
          //       Expanded(child: Text(text)),
          //
          //     //if( showSearch )
          //       Expanded(
          //         child: Container(
          //           padding: EdgeInsets.only(top: 5),
          //           child: CustomTextFormField(
          //             keyboardType: TextInputType.text,
          //             //autofocus: true,
          //             labelText: 'nav_Recherche'.tr,
          //             hintText: 'nav_RechercheHint'.tr,
          //             onChanged: (String? value) {
          //               //this.chantUser.position = value ?? '';
          //             },
          //             validator: (String? value) {
          //               if (value!.isEmpty) {
          //                 return '${'msg_required'.tr}';
          //               }
          //               return null;
          //             },
          //           ),
          //         ),
          //       ),
          //
          //     // if( !showSearch )
          //     //   IconButton(icon: const Icon(Icons.search),
          //     //       color: ColorResources.getColor(color: Colors.black),
          //     //       onPressed: () =>
          //     //           setState(() {
          //     //             showSearch = !showSearch;
          //     //           })),
          //     //
          //     // if( showSearch )
          //       IconButton(icon: const Icon(Icons.close),
          //           color: ColorResources.getColor(color: Colors.black),
          //           onPressed: () => Navigator.pop(context)),
          //   ],
          // ),
          titlePadding:
              const EdgeInsets.only(left: 10.0, right: 0.0, top: 0, bottom: 0),
          content: SingleSelectDialog(
            data: data,
            onSelectedChanged: (selected) => onSelectedChanged!(selected),
          ),
          contentPadding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
          actions: <Widget>[
            TextButton(
              onPressed: onDonePressed != null
                  ? onDonePressed()
                  : () {
                      Navigator.pop(context);
                    },
              child: Text('done'.tr),
            ),
          ],
        );
      });
}
