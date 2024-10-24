import 'package:flutter/material.dart';

import '../assets/app_color_palette.dart';

class TeDropDownMenu extends StatelessWidget {
  final BuildContext context;
  final dynamic value;
  final List items;
  final Function onChanged;

  const TeDropDownMenu(
      {super.key,
      required this.context,
      required this.value,
      required this.items,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: TeAppColorPalette.darkBlue,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(300),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            focusColor: TeAppColorPalette.grey,
            iconSize: 52,
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: TeAppColorPalette.darkBlue,
            ),
            value: value,
            onChanged: (newValue) {
              onChanged(newValue);
            },
             dropdownColor: TeAppColorPalette.white,
            items: items.map((item) {
        
              return DropdownMenuItem(
                
                value: item,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(color: TeAppColorPalette.darkBlue),
                    textAlign: TextAlign.left,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}