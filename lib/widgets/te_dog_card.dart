import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_theme.dart';
import 'package:pawhouse_admin_alpha_app/models/active_dog_model.dart';

class TeDogCard extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final ActiveDogModel dog;
  final dynamic nextScreen;

  const TeDogCard(
      {super.key,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.nextScreen,
      required this.dog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TeAppThemeData.generalGap),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextScreen));
        },
        child: Material(
          elevation: TeAppThemeData.teContainerElevation,
          borderRadius:
              BorderRadius.circular(TeAppThemeData.generalBorderRadius * 2),
          child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.all(
                    Radius.circular(TeAppThemeData.generalBorderRadius * 2))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: foregroundColor,
                    backgroundImage:
                        const AssetImage('assets/images/circleAvatarPic.png'),
                  ),
                  const SizedBox(
                    width: TeAppThemeData.generalGap,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${dog.info?.name} - ${dog.info?.breed}",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: foregroundColor),
                        ),
                        const SizedBox(
                          height: TeAppThemeData.textSmallGap - 2,
                        ),
                        Text(
                          dog.info?.gender == false ? "Hembra" : "Macho",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: foregroundColor),
                        ),
                        const SizedBox(
                          height: TeAppThemeData.textSmallGap - 2,
                        ),
                        Text(
                          dog.dinamicID,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: foregroundColor),
                        ),
                      ],
                    ),
                  ),
                  FaIcon(
                    FontAwesomeIcons.arrowRight,
                    color: foregroundColor,
                    size: 32,
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
