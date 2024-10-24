// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../assets/app_theme.dart';

class TeContainer extends StatelessWidget {
  final Widget content;
  final Color? color;
  final double? borderWidth;
  final Color? borderColor;
  final Gradient? gradient;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;

  const TeContainer({
    super.key,
    required this.content,
    this.color,
    this.gradient,
    this.onTap,
    this.width,
    this.height,
    this.padding,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: elevation?? TeAppThemeData.teContainerElevation,
        borderRadius: borderRadius ??
            BorderRadius.circular(TeAppThemeData.generalBorderRadius),
        child: Container(
          decoration: BoxDecoration(
            border: borderColor != null
                ? Border.all(
                    color: borderColor ?? Colors.transparent,
                    width: borderWidth ?? 0)
                : Border.all(color: Colors.transparent, width: 0),
            color: gradient == null ? color : null,
            gradient: gradient,
            borderRadius: borderRadius ??
                BorderRadius.circular(TeAppThemeData.generalBorderRadius),
          ),
          width: width,
          height: height,
          child: Padding(
              padding: padding != null
                  ? padding!
                  : EdgeInsets.symmetric(
                      horizontal: TeAppThemeData.containerPaddingHorizontral,
                      vertical: TeAppThemeData.containerPaddingVertical,
                    ),
              child: content),
        ),
      ),
    );
  }
}
