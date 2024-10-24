import 'package:flutter/material.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_color_palette.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_theme.dart';
import 'package:pawhouse_admin_alpha_app/models/owner_model.dart';

class TeOwnerCard extends StatelessWidget {
  final OwnerModel owner;

  const TeOwnerCard({super.key, required this.owner});

  @override
  Widget build(BuildContext context) {
    List<String> nameParts = owner.name.split(' ');

    String displayName = nameParts.isNotEmpty
        ? nameParts[0] +
            (nameParts.length > 1 ? ' ${nameParts[1]}' : '') 
        : owner.name; 

    return Material(
      elevation: TeAppThemeData.teContainerElevation,
      borderRadius: BorderRadius.circular(TeAppThemeData.generalBorderRadius),
      child: Container(
        decoration: const BoxDecoration(
          color: TeAppColorPalette.white,
          borderRadius: BorderRadius.all(
            Radius.circular(TeAppThemeData.generalBorderRadius),
          ),
        ),
        child: Column(
          children: [
            const ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(TeAppThemeData.generalBorderRadius),
                topRight: Radius.circular(TeAppThemeData.generalBorderRadius),
              ), 
              child: Image(
                image: AssetImage('assets/images/circleAvatarPic.png'),
                fit: BoxFit.cover,
                height: 120, 
                width: double.infinity,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  displayName, // Display the first name and first last name
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: TeAppColorPalette.darkBlue,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
