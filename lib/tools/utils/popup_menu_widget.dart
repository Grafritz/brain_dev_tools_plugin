import 'package:flutter/material.dart';

class PopupMenuWidget<T> extends PopupMenuEntry<T> {
  const PopupMenuWidget({super.key, this.height = 0.0, this.child});

  @override
  State<PopupMenuWidget> createState() => _PopupMenuWidgetState();

  final Widget? child;

  @override
  final double height;

  //@override
  bool get enabled => false;

  @override
  bool represents(T? value) {
    throw UnimplementedError();
  }
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  @override
  Widget build(BuildContext context) => widget.child!;
}
