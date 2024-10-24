 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../assets/app_color_palette.dart';
import '../assets/app_theme.dart';
import '../widgets/te_bottom_button.dart';
import '../widgets/te_container.dart';
import '../widgets/te_textfield.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  bool eatsInMorning = false;
  bool eatsInEvening = false;
  bool eatsInNight = false;
  bool medicine = false;

  final TextEditingController idController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController injuriesController = TextEditingController();
  final TextEditingController belongingsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check In'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: TeAppThemeData.appMargin),
              child: Column(
                children: [
                  const SizedBox(
                    height: TeAppThemeData.appMargin,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: TeAppColorPalette.darkBlue,
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.solidImage,
                          size: 100,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TeAppThemeData.generalGap,
                  ),
                  TeContainer(
                    elevation: 0,
                    onTap: () {}, // TODO
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 18),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Seleccionar peludo',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: TeAppColorPalette.darkBlue,
                              ),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.arrowRight,
                          size: TeAppThemeData.iconArrowSize,
                          color: TeAppColorPalette.darkBlue,
                        )
                      ],
                    ),
                    borderColor: TeAppColorPalette.darkBlue,
                    borderWidth: 4,
                    color: TeAppColorPalette.white,
                  ),
                  const SizedBox(
                    height: TeAppThemeData.generalGap,
                  ),
                  TeContainer(
                    borderWidth: 4,
                    borderColor: TeAppColorPalette.darkBlue,
                    color: TeAppColorPalette.white,
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Come En La Mañana?',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: TeAppColorPalette.darkBlue,
                              ),
                        ),
                        Checkbox(
                          activeColor: TeAppColorPalette.darkBlue,
                          checkColor: TeAppColorPalette.white,
                          side: WidgetStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                              color: TeAppColorPalette.darkBlue,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          value: eatsInMorning,
                          onChanged: (newValue) {
                            setState(() {
                              eatsInMorning = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TeAppThemeData.generalGap,
                  ),
                  TeContainer(
                    borderWidth: 4,
                    borderColor: TeAppColorPalette.darkBlue,
                    color: TeAppColorPalette.white,
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Come En La Tarde?',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: TeAppColorPalette.darkBlue,
                              ),
                        ),
                        Checkbox(
                          activeColor: TeAppColorPalette.darkBlue,
                          checkColor: TeAppColorPalette.white,
                          side: WidgetStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                              color: TeAppColorPalette.darkBlue,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          value: eatsInMorning,
                          onChanged: (newValue) {
                            setState(() {
                              eatsInMorning = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TeAppThemeData.generalGap,
                  ),
                  TeContainer(
                    borderWidth: 4,
                    borderColor: TeAppColorPalette.darkBlue,
                    color: TeAppColorPalette.white,
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Come En La Noche?',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: TeAppColorPalette.darkBlue,
                              ),
                        ),
                        Checkbox(
                          activeColor: TeAppColorPalette.darkBlue,
                          checkColor: TeAppColorPalette.white,
                          side: WidgetStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                              color: TeAppColorPalette.darkBlue,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          value: eatsInMorning,
                          onChanged: (newValue) {
                            setState(() {
                              eatsInMorning = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TeAppThemeData.generalGap,
                  ),
                  TeTextField(labelText: 'Peso', controller: weightController),
                  const SizedBox(
                    height: TeAppThemeData.generalGap,
                  ),
                  TeTextField(labelText: 'ID', controller: idController),
                  const SizedBox(
                    height: TeAppThemeData.generalGap,
                  ),
                  TeTextField(
                      labelText: 'Lesiones?', controller: injuriesController),
                  const SizedBox(
                    height: TeAppThemeData.generalGap,
                  ),
                  TeTextField(
                    labelText: 'Lista De Pertencias',
                    height: 100,
                    controller: belongingsController,
                  ),
                 
                   SizedBox(
                  height: 180 + TeAppThemeData.appMargin * 2,
                  width: double.infinity,
                  child: Center(
                    child: SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index < 3) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: index < 1
                                    ? TeAppThemeData.containerPaddingHorizontral
                                    : TeAppThemeData.generalGap,
                                right: index > 1
                                    ? TeAppThemeData.containerPaddingHorizontral
                                    : 0,
                              ),
                              child: Material(
                                elevation: TeAppThemeData.teContainerElevation,
                                borderRadius: BorderRadius.circular(
                                    TeAppThemeData.generalBorderRadius),
                                child: Container(
                                    height: 180,
                                    width: 140,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(TeAppThemeData
                                              .generalBorderRadius)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/pertenencia.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                            );
                          }
                          return null;
                        },
                        itemCount: 3,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100,)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.infinity,
              child: TeBottomButton(
                buttonText: 'Completar Check In',
                buttonAction: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
