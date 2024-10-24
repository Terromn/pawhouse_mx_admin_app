import 'package:flutter/material.dart';

import '../assets/app_color_palette.dart';

class TeCreateNumberedTextList extends StatelessWidget {
  final List<String> list;

  const TeCreateNumberedTextList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(color: TeAppColorPalette.darkBlue),
        children: [
          for (int i = 0; i < list.length; i++)
            TextSpan(
              children: [
                TextSpan(
                  text: '${i + 1}.- ',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: TeAppColorPalette.darkBlue,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '${list[i]}\n',
                ),
              ],
            ),
        ],
      ),
      maxLines: list.length,
    );
  }
}