// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:brain_dev_tools/tools/Enum/enum.dart';
import 'package:brain_dev_tools/views/base/show_case_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_resources.dart';
import 'styles.dart';

class DividerSectionTitle extends StatelessWidget {
  final String text;
  final double? fontSize;
  final EnumPositionText positionText;
  final bool showIcon;

  const DividerSectionTitle(
      {super.key,
      required this.text,
      this.fontSize = 18.0,
      this.positionText = EnumPositionText.center,
      this.showIcon=false,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          if (positionText == EnumPositionText.center ||
              positionText == EnumPositionText.right)
            Expanded(
                child: Divider(
              color: Colors.grey.shade600,
            )),
          if (positionText == EnumPositionText.center ||
              positionText == EnumPositionText.right)
            const SizedBox(width: 10.0),

          if (showIcon)
          Icon(Icons.info_outline,
              color: ColorResources.getColor(
                  color: Theme.of(context).primaryColor)),
          if (showIcon)
          const SizedBox(width: 3.0),

          Text(text, style: titlePlandeLecture),
          //style: GoogleFonts.pacifico(color: Colors.black, fontSize: fontSize), ),

          if (positionText == EnumPositionText.center ||
              positionText == EnumPositionText.left)
            const SizedBox(width: 10.0),
          if (positionText == EnumPositionText.center ||
              positionText == EnumPositionText.left)
            Expanded(
                child: Divider(
              color: Colors.grey.shade600,
            )),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.text, this.hasViewAll=false, this.onTapViewAll,
    this.left= 15, this.top= 0, this.bottom= 10, this.right= 15,
    this.showCaseKey
  });
final String text;
final bool hasViewAll;
final double left, top, bottom, right;
/// Called when the user taps this part of the material.
final GestureTapCallback? onTapViewAll;
final GlobalKey<State<StatefulWidget>>? showCaseKey;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: left, top: top, bottom: bottom, right: right),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: 'Brandon',
              fontSize: 18,
            ),
          ),
          if( hasViewAll )
            Column(
              children: [
                if( showCaseKey!=null)
                  ShowCaseButton(
                    globalKey: showCaseKey!,
                    globalKeys: [],
                    title: 'view_all'.tr,
                    description: 'view_all_desc'.tr,
                    targetPadding: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: onTapViewAll,
                      child: AutoSizeText(
                        'view_all'.tr,
                        style: viewAllStyle,
                      ),
                    ),
                  )
                else
                  InkWell(
                    onTap: onTapViewAll,
                    child: AutoSizeText(
                      'view_all'.tr,
                      style: viewAllStyle,
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
