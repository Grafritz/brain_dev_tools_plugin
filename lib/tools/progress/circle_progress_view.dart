import 'package:flutter/material.dart';

import 'circle_progress.dart';

class CircleProgressView extends StatelessWidget {
  const CircleProgressView({super.key,
    required this.progressPercent,
    this.progressBackGroundColor,
    this.progressColor, this.width=55,  this.height=55,
    this.strokeWidth=6, this.fontSize=10,
    this.fontColor, });

  final double progressPercent;
  final Color? progressBackGroundColor;
  final Color? progressColor;
  final double width;
  final double height;
  final double strokeWidth;
  final double fontSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        foregroundPainter: CircleProgress(context,
            currentProgress: progressPercent,
            strokeWidth: strokeWidth,
            progressColor: progressColor,
            progressBackGroundColor: progressBackGroundColor
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Center(child: Text('${progressPercent.toInt()}%',
              style: TextStyle(fontSize: fontSize, color: getFontColor(context)))),
        ),
      ),
    );
  }

  getFontColor( BuildContext context ){
    if( progressColor!=null) {
      return progressColor;
    }
    if( fontColor == null ){
      return Theme.of(context).primaryColorDark;
    }
    return fontColor;
  }
}
