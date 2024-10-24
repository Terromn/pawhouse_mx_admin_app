// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_container.dart';

import '../assets/app_color_palette.dart';
import '../assets/app_theme.dart';
import '../widgets/te_bottom_button.dart';
import '../widgets/te_dropdown_menu.dart';

class ReserveScreen extends StatefulWidget {
  const ReserveScreen({super.key});

  @override
  State<ReserveScreen> createState() => _ReserveScreenState();
}

class _ReserveScreenState extends State<ReserveScreen> {
  String selectedPackage = '10:30AM-12:30PM';
  List<String> classCoachesDropDownMenu = [
    '10:30AM-12:30PM',
    '5:30PM-6:30PM',
  ];

  final TextEditingController nameController = TextEditingController();
  bool reserveDogsBrothers = false;
  DateTime entryDate = DateTime.now();
  DateTime exitDate = DateTime.now();

  void _showDatePicker(
      DateTime initialDate, ValueChanged<DateTime> onDateChanged) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: initialDate,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            showDayOfWeek: true,
            onDateTimeChanged: onDateChanged,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const SafeArea(
          bottom: false,
          child: SizedBox(
            height: 1,
          ),
        ),
        appBar: AppBar(
          title: const Text('Reservar a Peludo'),
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
                      elevation: 0,
                      onTap: () {}, // TODO
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 2),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fecha De Entrada',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: TeAppColorPalette.darkBlue,
                                ),
                          ),
                          CupertinoButton(
                            onPressed: () =>
                                _showDatePicker(entryDate, (DateTime newDate) {
                              setState(() => entryDate = newDate);
                            }),
                            child: Text(
                              '${entryDate.month}/${entryDate.day}/${entryDate.year}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    color: TeAppColorPalette.darkBlue,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      borderColor: TeAppColorPalette.darkBlue,
                      borderWidth: 4,
                      color: TeAppColorPalette.white,
                    ),
                    const SizedBox(
                      height: TeAppThemeData.generalGap,
                    ),
                     TeDropDownMenu(
                      context: context,
                      value: selectedPackage,
                      items: classCoachesDropDownMenu,
                      onChanged: (newValue) {
                        setState(() {
                          selectedPackage = newValue;
                        });
                      },
                    ),
                    
                    const SizedBox(
                      height: TeAppThemeData.generalGap,
                    ),
                    TeContainer(
                      elevation: 0,
                      onTap: () {}, // TODO
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 2),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fecha De Salida',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: TeAppColorPalette.darkBlue,
                                ),
                          ),
                          CupertinoButton(
                            onPressed: () =>
                                _showDatePicker(exitDate, (DateTime newDate) {
                              setState(() => exitDate = newDate);
                            }),
                            child: Text(
                              '${exitDate.month}/${exitDate.day}/${exitDate.year}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    color: TeAppColorPalette.darkBlue,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      borderColor: TeAppColorPalette.darkBlue,
                      borderWidth: 4,
                      color: TeAppColorPalette.white,
                    ),
                    const SizedBox(
                      height: TeAppThemeData.generalGap,
                    ),
                    TeDropDownMenu(
                      context: context,
                      value: selectedPackage,
                      items: classCoachesDropDownMenu,
                      onChanged: (newValue) {
                        setState(() {
                          selectedPackage = newValue;
                        });
                      },
                    ),
                    
                    const SizedBox(
                      height: TeAppThemeData.generalGap,
                    ),
                    TeContainer(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 4),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reservar A Hermanitos?',
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
                            value: reserveDogsBrothers,
                            onChanged: (newValue) {
                              setState(() {
                                reserveDogsBrothers = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                      borderColor: TeAppColorPalette.darkBlue,
                      borderWidth: 4,
                      color: TeAppColorPalette.white,
                    ),
                    const SizedBox(
                      height: TeAppThemeData.generalGap,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
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
                  buttonText: '¡Crear Perfil!',
                  buttonAction: () {},
                ),
              ),
            ),
          ],
        ));
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
