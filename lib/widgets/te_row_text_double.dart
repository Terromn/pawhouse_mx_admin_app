import 'package:flutter/material.dart';

import '../assets/app_color_palette.dart';
import '../assets/app_theme.dart';

class TeRowTextDouble extends StatelessWidget {
  final String firstValue;
  final dynamic firstStyle;
  final String secondValue;
  final dynamic secondStyle;

  final bool isLast;

  const TeRowTextDouble({
    super.key,
    required this.firstValue,
    required this.secondValue,
    required this.isLast,
    this.firstStyle,
    this.secondStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: isLast ? 0 : TeAppThemeData.textSmallGap),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            firstValue,
            style: firstStyle ?? Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: TeAppColorPalette.white)
          ),
          Text(
            secondValue,
            style: secondStyle ?? Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: TeAppColorPalette.white)
          ),
        ],
      ),
    );
  }
}
