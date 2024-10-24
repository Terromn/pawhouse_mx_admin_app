import 'package:flutter/material.dart';

class TeMediaQuery {
  static double getPercentageHeight(BuildContext context, double percentage) {
    double screenHeight = MediaQuery.of(context).size.height;
    return (percentage / 100.0) * screenHeight;
  }

  static double getPercentageHeightUsingAppBar(
      BuildContext context, double percentage) {
    double screenHeight = MediaQuery.of(context).size.height;
    return (percentage / 100.0) * screenHeight - AppBar().preferredSize.height;
  }

  static double getPercentageWidth(BuildContext context, double percentage) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (percentage / 100.0) * screenWidth;
  }


}
