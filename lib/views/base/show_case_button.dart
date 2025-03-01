import 'package:brain_dev_tools/controllers/theme_controller.dart';
import 'package:brain_dev_tools/tools/utils/divider_Inter_text.dart';
import 'package:brain_dev_tools/tools/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowCaseButton extends StatelessWidget {
  const ShowCaseButton({super.key,
    required this.globalKey,
    this.globalKeys,
    required this.child,
    required this.description,
    this.title,
    this.showButtonSkip=false,
    this.height= 50,
    this.width= 120,
    this.targetPadding= EdgeInsets.zero,
    this.tooltipBackgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.targetShapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    this.tooltipActionConfig= const TooltipActionConfig(
      alignment: MainAxisAlignment.end,
      position: TooltipActionPosition.outside,
      gapBetweenContentAndAction: 10,
    ),
  });
  final String? title;
  final String description;
  final GlobalKey globalKey;
  final List<GlobalKey>? globalKeys;
  final Widget child;
  final bool showButtonSkip;
  final double height, width;
  /// Padding around target widget
  ///
  /// Default to [EdgeInsets.zero]
  final EdgeInsets targetPadding;
  /// Defines background color for tooltip widget.
  ///
  /// Default to [Colors.white]
  final Color tooltipBackgroundColor;
  /// Defines text color of default tooltip when [titleTextStyle] and
  /// [descTextStyle] is not provided.
  ///
  /// Default to [Colors.black]
  final Color textColor;
  /// ShapeBorder of the highlighted box when target widget will be showcased.
  ///
  /// Note: If [targetBorderRadius] is specified, this parameter will be ignored.
  ///
  /// Default value is:
  /// ```dart
  /// RoundedRectangleBorder(
  ///   borderRadius: BorderRadius.all(Radius.circular(8)),
  /// ),
  /// ```
  final ShapeBorder targetShapeBorder;
  /// Provide a configuration for tooltip action widget like alignment,
  /// position, gap, etc...
  ///
  /// Default to [const TooltipActionConfig()]
  final TooltipActionConfig? tooltipActionConfig;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeCtr) {
        return showcaseWithWidget(context: context, themeCtr: themeCtr);
      }
    );
  }

  showcaseWithWidget({ required ThemeController themeCtr, required BuildContext context}) {
    // if( showButtonSkip ) {
    //   return Showcase.withWidget(
    //     key: globalKey,
    //     height: height,//double.infinity,//50,//
    //     width: width,//double.infinity,//140,//
    //     targetPadding: targetPadding,
    //     //tooltipBackgroundColor: Theme.of(context).primaryColor,
    //     //textColor: Colors.white,
    //     targetShapeBorder: targetShapeBorder,
    //     container: buttonOption(themeCtr: themeCtr, context: context),
    //     tooltipActionConfig: tooltipActionConfig,
    //     child: child,
    //   );
    // }
    return Showcase(
      key: globalKey,
      title: title,
      description: description,
      targetPadding: targetPadding,
      tooltipBackgroundColor: tooltipBackgroundColor,
      textColor: textColor,
      targetShapeBorder: targetShapeBorder,
      tooltipActionConfig: tooltipActionConfig,
      child: child,
    );
  }
  buttonOption({required ThemeController themeCtr, required BuildContext context}) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if( title!=null )
            SectionTitle(text: title!.tr, hasViewAll: false, left: 0, top: 0, bottom: 2,),

          Text(description, style: TextStyle(color: Colors.black),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              Tooltip(message: 'label_never_show'.tr,
                child: TextButton(
                    onPressed: (){
                      themeCtr.isShowCaseHomeEnable=false;
                      ShowCaseWidget.of(context).dismiss();
                    },
                    child: Text('label_never_show'.tr, style: viewAllStyle)
                ),
              ),

              if( !themeCtr.isShowCaseHome2Time )
                Tooltip(message: 'label_skip'.tr,
                  child: TextButton(
                      onPressed: (){
                        ShowCaseWidget.of(context).dismiss();
                      },
                      child: Text('label_skip'.tr, style: viewAllStyle)
                  ),
                ),
              IconButton(
                  tooltip: 'skip previous',
                  onPressed: (){
                    ShowCaseWidget.of(context).previous();
                  },
                  icon: Icon(Icons.skip_previous_outlined)
              ),
              // Tooltip(
              //   message: 'Indicator counter',
              //   child: Text('$indicatorCurrent/$countGlobalKeys', style: viewAllStyle),
              // ),
              IconButton(
                  tooltip: 'skip next',
                  onPressed: (){
                    ShowCaseWidget.of(context).next();
                  },
                  icon: Icon(Icons.skip_next_outlined)
              ),
            ],
          ),

        ],
      ),
    );
  }

  // String get indicatorCurrent {
  //   return '${globalKeys.indexWhere((x)=> x==globalKey)+1}';
  // }
  // get countGlobalKeys {
  //   return '${globalKeys.length}';
  // }
}
