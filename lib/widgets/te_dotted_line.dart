import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_color_palette.dart';

class TeDottedLine extends StatelessWidget {
  final double width;

  const TeDottedLine({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    int count = (width / 16).ceil();
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Row(
          children: List.generate(count, (index) {
            return Row(
              children: [
                Container(
                  width: 8,
                  height: 4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    color: TeAppColorPalette.grey,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            );
          }),
        ),
      ),
    );
  }
}
