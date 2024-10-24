// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_theme.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_container.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../assets/app_color_palette.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: TeAppThemeData.appMargin),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: TeAppThemeData.appMargin,
              ),
              TeContainer(
                gradient: const LinearGradient(
                  colors: [
                    TeAppColorPalette.blue,
                    TeAppColorPalette.blueGreeny
                  ],
                  stops: [0.4, 1.0],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topLeft,
                ),
                content: Column(
                  children: [
                    Row(children: [
                      Text('Ingresos',
                          style: Theme.of(context).textTheme.displayLarge)
                    ]),
                    const SizedBox(
                      height: TeAppThemeData.textBigGap,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Mensual',
                              style: Theme.of(context).textTheme.displayMedium),
                          Text(
                            '\$22,750 MXN',
                            style: GoogleFonts.montserrat(
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ]),
                    const SizedBox(
                      height: TeAppThemeData.textSmallGap,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Dia De Hoy',
                              style: Theme.of(context).textTheme.displayMedium),
                          Text(
                            '\$2,400 MXN',
                            style: GoogleFonts.montserrat(
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ]),
                  ],
                ),
              ),
              const SizedBox(
                height: TeAppThemeData.generalGap,
              ),
              TeContainer(
                padding: const EdgeInsets.only(
                    left: TeAppThemeData.containerPaddingHorizontral,
                    right: TeAppThemeData.containerPaddingHorizontral,
                    top: TeAppThemeData.containerPaddingVertical,
                    bottom: 0),
                color: TeAppColorPalette.darkBlue,
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Peludos En \nTotal:',
                          style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        GradientText(
                          '24',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 72),
                          gradientDirection: GradientDirection.ltr,
                          gradientType: GradientType.linear,
                          colors: const [
                            TeAppColorPalette.blue,
                            TeAppColorPalette.blueGreeny,
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Image(
                          image: AssetImage('assets/images/peludosTotal.png'),
                          height: 120,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: TeAppThemeData.generalGap,
              ),
              TeContainer(
                padding: const EdgeInsets.only(
                    left: TeAppThemeData.containerPaddingHorizontral,
                    right: TeAppThemeData.containerPaddingHorizontral,
                    top: TeAppThemeData.containerPaddingVertical,
                    bottom: 0),
                color: TeAppColorPalette.darkBlue,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Peludos Que Llegaran Hoy:',
                      style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    SizedBox(
                      height: TeAppThemeData.textBigGap,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 140,
                            width: double.infinity,
                            child: Image(
                              image:
                                  AssetImage('assets/images/llegaranHoy.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 140,
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GradientText(
                                '2/5',
                                style: GoogleFonts.montserrat(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                    fontSize: 72),
                                gradientDirection: GradientDirection.btt,
                                gradientType: GradientType.linear,
                                colors: const [
                                  TeAppColorPalette.blue,
                                  TeAppColorPalette.blueGreeny,
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: TeAppThemeData.generalGap,
              ),
              TeContainer(
                padding: const EdgeInsets.only(
                    left: 0,
                    right: TeAppThemeData.containerPaddingHorizontral,
                    top: TeAppThemeData.containerPaddingVertical,
                    bottom: TeAppThemeData.containerPaddingVertical),
                color: TeAppColorPalette.darkBlue,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: TeAppThemeData.containerPaddingHorizontral),
                      child: Text(
                        'Peludos Que Se Irán Hoy:',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: TeAppThemeData.textBigGap,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 120,
                            width: double.infinity,
                            child: Image(
                              image: AssetImage('assets/images/seVanHoy.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GradientText(
                                '7/12',
                                style: GoogleFonts.montserrat(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                    fontSize: 72),
                                gradientDirection: GradientDirection.rtl,
                                gradientType: GradientType.linear,
                                colors: const [
                                  TeAppColorPalette.blue,
                                  TeAppColorPalette.blueGreeny,
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: TeAppThemeData.generalGap,
              ),
              Row(
                children: [
                  Expanded(
                      child: TeContainer(
                    color: TeAppColorPalette.blueGreeny,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Peludos Que Se Irán Mañana:',
                          style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '9',
                              style: GoogleFonts.montserrat(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 72),
                            )
                          ],
                        )
                      ],
                    ),
                    width: double.infinity,
                    height: 200,
                  )),
                  SizedBox(
                    width: TeAppThemeData.generalGap,
                  ),
                  Expanded(
                      child: TeContainer(
                    color: TeAppColorPalette.blue,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Peludos Que Llegaran Mañana:',
                          style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '4',
                              style: GoogleFonts.montserrat(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 72),
                            )
                          ],
                        )
                      ],
                    ),
                    width: double.infinity,
                    height: 200,
                  ))
                ],
              ),
              SizedBox(
                height: TeAppThemeData.appMargin,
              )
            ],
          ),
        ),
      ),
    );
  }
}
