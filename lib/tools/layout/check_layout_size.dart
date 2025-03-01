
import 'package:flutter/material.dart';

class CheckLayoutSize {
  // This isMobile, isTablet, isDesktop help us later
  bool isMobile(BuildContext context) =>
  MediaQuery.of(context).size.width < 650;

  bool isTablet(BuildContext context) =>
  MediaQuery.of(context).size.width < 1100 &&
  MediaQuery.of(context).size.width >= 650;

  bool isDesktop(BuildContext context) =>
  MediaQuery.of(context).size.width >= 1100;
}
