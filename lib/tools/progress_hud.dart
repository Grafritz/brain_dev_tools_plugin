
import 'package:flutter/material.dart';

class ProgressHud extends StatelessWidget{

  //region [ Attributs ]
  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Animation<Color>? valueColor;
  //endregion

  const ProgressHud({
    super.key,
    required this.child,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);

    if (inAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          Center(
            child: CircularProgressIndicator(
              valueColor: valueColor,
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }

    return Stack(
      children: widgetList,
    );

  }

}