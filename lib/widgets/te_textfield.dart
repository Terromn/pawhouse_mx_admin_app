import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../assets/app_color_palette.dart';
import '../assets/app_theme.dart';

class TeTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final double? height;
  final List<TextInputFormatter>? textInputFormatters;
  final String? suffixText;
  final TextStyle? suffixStyle;

  const TeTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.textInputType,
    this.height,
    this.textInputFormatters, this.suffixText, this.suffixStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: TeAppColorPalette.darkBlue,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(TeAppThemeData.generalBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 18),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                
                controller: controller,
                inputFormatters: textInputFormatters,
                keyboardType: textInputType, // Assigning keyboardType here
                maxLength: textInputType ==
                        const TextInputType.numberWithOptions(
                            signed: true, decimal: false)
                    ? 10
                    : 100,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: TeAppColorPalette.darkBlue,
                    fontWeight: FontWeight.bold),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  labelText: labelText,
                  counterText: '',
                  suffixText: suffixText,
                  suffixStyle: suffixStyle,
                  isCollapsed: true,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: TeAppColorPalette.darkBlue),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 24.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  alignLabelWithHint: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
