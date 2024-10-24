// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_color_palette.dart';
import 'package:pawhouse_admin_alpha_app/models/active_dog_model.dart';
import 'package:pawhouse_admin_alpha_app/utils/te_calculate.dart';

import '../assets/app_theme.dart';
import '../utils/create_numbered_text_list.dart';
import '../widgets/te_container.dart';
import '../widgets/te_row_text_double.dart';

class DogProfileScreen extends StatelessWidget {
  final ActiveDogModel activeDog;

  const DogProfileScreen({super.key, required this.activeDog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 220.0,
            elevation: 20,
            forceElevated: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Perfil De ${activeDog.info!.name}",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(color: TeAppColorPalette.white),
              ),
              background: activeDog.info!.profilePhotoPath.isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(activeDog.info!.profilePhotoPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      color: TeAppColorPalette.darkBlue,
                      child: const Center(
                        child: Icon(
                          Icons.pets,
                          size: 120,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: TeAppThemeData.appMargin,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: TeAppThemeData.appMargin,
                        ),
                        TeContainer(
                          onTap: () {},
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${activeDog.info!.name} - ${activeDog.dinamicID}',
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
                                height: TeAppThemeData.textBigGap,
                              ),
                              TeRowTextDouble(
                                firstValue: 'Dueño',
                                secondValue:
                                    '${activeDog.info!.owner?.name} ${activeDog.info!.owner?.lastName}',
                                isLast: false,
                              ),
                              TeRowTextDouble(
                                firstValue: 'Telefono',
                                secondValue: activeDog.info!.owner!.phoneNumber
                                    .toString(),
                                isLast: false,
                              ),
                              TeRowTextDouble(
                                firstValue: 'Telefono Secundario',
                                secondValue: activeDog
                                    .info!.owner!.secondaryPhoneNumber
                                    .toString(),
                                isLast: false,
                              ),
                              TeRowTextDouble(
                                firstValue: 'Raza',
                                secondValue: activeDog.info!.breed,
                                isLast: false,
                              ),
                              TeRowTextDouble(
                                firstValue: 'Sexo',
                                secondValue: activeDog.info!.gender == false
                                    ? 'Hembra'
                                    : 'Macho',
                                isLast: false,
                              ),
                              TeRowTextDouble(
                                firstValue: 'Peso',
                                secondValue: "${activeDog.info!.weight}Kg",
                                isLast: false,
                              ),
                              TeRowTextDouble(
                                firstValue: 'Peso De Entrada',
                                secondValue: "${activeDog.startingWeight}Kg",
                                isLast: false,
                              ),
                              TeRowTextDouble(
                                firstValue: 'Edad',
                                secondValue:
                                    '${Calculate.age(activeDog.info!.birthDate)} Años',
                                isLast: true,
                              ),
                            ],
                          ),
                          color: TeAppColorPalette.darkBlue,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: TeAppThemeData.generalGap,
                        ),
                        TeContainer(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Actividades Favoritas:',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                        color: TeAppColorPalette.darkBlue),
                              ),
                              SizedBox(
                                height: TeAppThemeData.textSmallGap,
                              ),
                              TeCreateNumberedTextList(
                                  list: activeDog.info!.favoriteActivities),
                            ],
                          ),
                          width: double.infinity,
                          color: TeAppColorPalette.white,
                          borderColor: TeAppColorPalette.darkBlue,
                          borderWidth: 6.0,
                        ),
                        SizedBox(
                          height: TeAppThemeData.generalGap,
                        ),
                        TeContainer(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Comentarios:',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                        color: TeAppColorPalette.darkBlue),
                              ),
                              SizedBox(
                                height: TeAppThemeData.textSmallGap,
                              ),
                              TeCreateNumberedTextList(
                                  list: activeDog.info!.comments),
                            ],
                          ),
                          width: double.infinity,
                          color: TeAppColorPalette.white,
                          borderColor: TeAppColorPalette.darkBlue,
                          borderWidth: 6.0,
                        ),
                        SizedBox(
                          height: TeAppThemeData.generalGap,
                        ),
                        TeContainer(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lista De Pertenencias:',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                        color: TeAppColorPalette.darkBlue),
                              ),
                              SizedBox(
                                height: TeAppThemeData.textSmallGap,
                              ),
                              TeCreateNumberedTextList(
                                  list: activeDog.listOfBelongings),
                            ],
                          ),
                          width: double.infinity,
                          color: TeAppColorPalette.white,
                          borderColor: TeAppColorPalette.darkBlue,
                          borderWidth: 6.0,
                        ),
                        SizedBox(
                          height: TeAppThemeData.generalGap,
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
                                      ? TeAppThemeData
                                          .containerPaddingHorizontral
                                      : TeAppThemeData.generalGap,
                                  right: index > 1
                                      ? TeAppThemeData
                                          .containerPaddingHorizontral
                                      : 0,
                                ),
                                child: Material(
                                  elevation:
                                      TeAppThemeData.teContainerElevation,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
