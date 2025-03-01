import 'dart:math';
import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {

  double? currentProgress;
  BuildContext? context;
  double? strokeWidth=10;
  Color? progressColor;
  Color? progressBackGroundColor;

  CircleProgress(this.context, {
    this.currentProgress,
    this.strokeWidth=10,
    this.progressColor,
    this.progressBackGroundColor });

  @override
  void paint(Canvas canvas, Size size) {

    if( progressBackGroundColor==null ) {
      if (progressColor != null) {
        if( progressColor!=Theme.of(context!).primaryColorDark){
          progressBackGroundColor = Colors.grey[300];
        }else{
          progressBackGroundColor = Theme.of(context!).primaryColorLight;
        }
      }else{
        progressBackGroundColor = Theme.of(context!).primaryColorLight;
      }
    }
    progressColor ??= Theme.of(context!).primaryColorDark;

    //if( progressColor!=null && progressBackGroundColor==null )
    //  progressBackGroundColor = Theme.of(context).primaryColorLight;

    Paint outerCircle = Paint()
      ..strokeWidth = strokeWidth!
      ..color = progressBackGroundColor!
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = strokeWidth!
      ..color = progressColor!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width/2, size.height/2) - strokeWidth!;
    
    canvas.drawCircle(center, radius, outerCircle); // For draws main outer Circle

    double angle = 2 * pi * (currentProgress!/100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi/2, angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}