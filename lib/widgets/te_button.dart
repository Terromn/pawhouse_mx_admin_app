import 'package:flutter/material.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_theme.dart';

import '../assets/app_color_palette.dart';
import 'te_media_query.dart';

class TeButton extends StatelessWidget {
  final dynamic childWidget;
  final dynamic buttonAction;
  final double elevation;
  final LinearGradient? linearGradient;
  final Color? color;
  final double? height;

  const TeButton({
    super.key,
    required this.buttonAction,
    required this.childWidget,
    this.height,
    this.linearGradient,
    this.color, 
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonAction();
      },
      child: Material(
        borderRadius:
            BorderRadius.circular(TeAppThemeData.generalBorderRadius) * 1.125,
        elevation: elevation,
        child: Container(
          decoration: BoxDecoration(
            gradient: linearGradient,
            color: color,
            borderRadius:
                BorderRadius.circular(TeAppThemeData.generalBorderRadius) *
                    1.125,
          ),
          height: height,
          width: double.infinity,
          child: childWidget,
        ),
      ),
    );
  }
}
