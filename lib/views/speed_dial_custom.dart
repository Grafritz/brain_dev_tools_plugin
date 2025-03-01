import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialCustom extends StatelessWidget {
  const SpeedDialCustom({super.key,
    this.children = const [],
    this.visible = true,
    this.backgroundColor,
    this.foregroundColor,
    this.activeBackgroundColor,
    this.activeForegroundColor,
    this.animatedIcon,
    this.shape = const StadiumBorder(),
    this.curve = Curves.fastOutSlowIn,
    this.onPress,
  });
  /// The animated icon to show as the main button child. If this is provided the [child] is ignored.
  final AnimatedIconData? animatedIcon;
  /// Children buttons, from the lowest to the highest.
  final List<SpeedDialChild> children;

  /// Used to get the button hidden on scroll. See examples for more info.
  final bool visible;

  /// The curve used to animate the button on scrolling.
  final Curve curve;

  /// The tooltip of this `SpeedDial`
  //final String? tooltip;

  /// The hero tag used for the fab inside this `SpeedDial`
  //final String? heroTag;

  /// The color of the background of this `SpeedDial`
  final Color? backgroundColor;

  /// The color of the foreground of this `SpeedDial`
  final Color? foregroundColor;

  /// The color of the background of this `SpeedDial` when it is open
  final Color? activeBackgroundColor;

  /// The color of the foreground of this `SpeedDial` when it is open
  final Color? activeForegroundColor;

  /// The intensity of the shadow for this `SpeedDial`
  //final double elevation;

  /// The size for this `SpeedDial` button
  //final Size buttonSize;

  /// The size for this `SpeedDial` children
  //final Size childrenButtonSize;

  /// The shape of this `SpeedDial`
  final ShapeBorder shape;

  /// The gradient decoration for this `SpeedDial`
  //final Gradient? gradient;

  /// The shape of the gradient decoration for this `SpeedDial`
  //final BoxShape gradientBoxShape;

  /// Whether speedDial initialize with open state or not, defaults to false.
  //final bool isOpenOnStart;

  /// Whether to close the dial on pop if it's open.
  //final bool closeDialOnPop;
  /// Executed when the dial is opened.
  //final VoidCallback? onOpen;

  /// Executed when the dial is closed.
  //final VoidCallback? onClose;

  /// Executed when the dial is pressed. If given, the dial only opens on long press!
  final VoidCallback? onPress;


  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: animatedIcon,
      visible: visible,
      curve: curve,
      useRotationAnimation: true,
      //animationDuration: const Duration(milliseconds: 1500),
      elevation: 2.0,
      backgroundColor: Colors.teal,
      onPress: onPress,
      children: children,
    );
  }
}
