// ignore_for_file: prefer_const_constructors, void_checks

import 'package:flutter/material.dart';
import 'package:pawhouse_admin_alpha_app/models/active_dog_model.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_zigzag_clipper.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_dotted_line.dart';

import '../assets/app_color_palette.dart';
import '../assets/app_theme.dart';
import '../utils/create_numbered_text_list.dart';
import '../widgets/te_bottom_button.dart';
import '../widgets/te_container.dart';
import '../widgets/te_row_text_double.dart';
import '../widgets/te_row_text_triple.dart';

class CheckOutScreen extends StatefulWidget {
  final ActiveDogModel dog;

  const CheckOutScreen({super.key, required this.dog});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.dog.info!.profilePhotoPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: TeAppThemeData.appMargin,
                      left: TeAppThemeData.appMargin,
                      top: TeAppThemeData.appMargin),
                  child: Column(
                    children: [
                      ClipPath(
                        clipper:
                            TeZigzagClipper(zigzagHeight: 10, zigzagWidth: 10),
                        child: TeContainer(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  TeAppThemeData.generalBorderRadius), topRight: Radius.circular(TeAppThemeData.generalBorderRadius)),
                          onTap: () {},
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pawhouse, Estadía De ${widget.dog.info?.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(color: TeAppColorPalette.white),
                              ),
                              SizedBox(
                                height: TeAppThemeData.textSmallGap,
                              ),
                              Text(
                                '4 de Julio, 2024 - 10 de Julio, 2024',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: TeAppColorPalette.white),
                              ),
                              SizedBox(
                                height: TeAppThemeData.textBigGap * 2,
                              ),
                              TeDottedLine(width: 304),
                              SizedBox(
                                height: TeAppThemeData.textBigGap * 2,
                              ),
                              Text(
                                'Estancia:',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        color: TeAppColorPalette.white,
                                        fontWeight: FontWeight.bold),
                              ),
                              TeRowTextTriple(
                                firstValue: '7 Noches',
                                secondValue: '\$300 MXN',
                                thirdValue: '\$2,100 MXN',
                                isLast: false,
                              ),
                              SizedBox(
                                height: TeAppThemeData.textBigGap * 2,
                              ),
                              TeDottedLine(width: 304),
                              SizedBox(
                                height: TeAppThemeData.textBigGap * 2,
                              ),
                              Text(
                                'Otros Servicios:',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        color: TeAppColorPalette.white,
                                        fontWeight: FontWeight.bold),
                              ),
                              TeRowTextTriple(
                                firstValue: '1 Aseo GE',
                                secondValue: '\$200 MXN',
                                thirdValue: '\$200 MXN',
                                isLast: false,
                              ),
                              TeRowTextTriple(
                                firstValue: '1 Baño Costesía',
                                secondValue: '\$0 MXN',
                                thirdValue: '\$0 MXN',
                                isLast: false,
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: TeAppColorPalette.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                height: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40, bottom: 40 - 16),
                                child: TeRowTextDouble(
                                    firstValue: 'TOTAL:',
                                    firstStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                            color: TeAppColorPalette.white,
                                            fontWeight: FontWeight.bold),
                                    secondValue: '\$2,300 MXN',
                                    secondStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                            color: TeAppColorPalette.white,
                                            fontWeight: FontWeight.bold),
                                    isLast: true),
                              )
                            ],
                          ),
                          color: TeAppColorPalette.darkBlue,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(
                        height: TeAppThemeData.generalGap,
                      ),
                      TeContainer(
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Lista De Pertenencias:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                          color: TeAppColorPalette.darkBlue),
                                ),
                                Text(
                                  widget.dog.dinamicID,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                          color: TeAppColorPalette.darkBlue),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: TeAppThemeData.textSmallGap,
                            ),
                            TeCreateNumberedTextList(
                                list: widget.dog.listOfBelongings),
                          ],
                        ),
                        width: double.infinity,
                        color: TeAppColorPalette.white,
                        borderColor: TeAppColorPalette.darkBlue,
                        borderWidth: 6.0,
                      ),
                    ],
                  ),
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
                                    decoration: BoxDecoration(
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
                SizedBox(height: 100,)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.infinity,
              child: TeBottomButton(
                buttonText: '¡Hasta Pronto ${widget.dog.info?.name}!',
                buttonAction: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
