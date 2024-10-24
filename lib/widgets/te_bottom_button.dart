import 'package:flutter/material.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_theme.dart';

import '../assets/app_color_palette.dart';
import 'te_media_query.dart';

class TeBottomButton extends StatelessWidget {
  final String buttonText;
  final dynamic buttonAction;

  const TeBottomButton({
    super.key,
    required this.buttonAction, required this.buttonText,
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
        elevation: TeAppThemeData.teContainerElevation,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [TeAppColorPalette.blue, TeAppColorPalette.blueGreeny],
              stops: [0.4, 1.0],
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
            ),
            borderRadius:
                BorderRadius.circular(TeAppThemeData.generalBorderRadius) *
                    1.125,
          ),
          height: 100,
          width: double.infinity,
          child: Center(
              child: Text(
            buttonText,
            style: Theme.of(context).textTheme.displayLarge,
          )),
        ),
      ),
    );
  }
}
