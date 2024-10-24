import 'package:flutter/material.dart';

import '../assets/app_color_palette.dart';
import '../assets/app_theme.dart';

class TeRowTextTriple extends StatelessWidget {
  final String firstValue;
  final String secondValue;
  final String thirdValue;
  final bool isLast;

  const TeRowTextTriple({
    super.key,
    required this.firstValue,
    required this.secondValue,
    required this.isLast,
    required this.thirdValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: isLast ? 0 : TeAppThemeData.textSmallGap),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  firstValue,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: TeAppColorPalette.white),
                ),
                Text(
                  thirdValue,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: TeAppColorPalette.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Positioned(
              right: 110,
              child: Text(
                secondValue,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: TeAppColorPalette.white),
              ),
            ),
          ],
        ));
  }
}
