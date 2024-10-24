import 'package:flutter/material.dart';

import '../assets/app_theme.dart';
import '../models/active_dog_model.dart';
import '../models/dog_model.dart';
import '../models/owner_model.dart';

class DogListScreen extends StatefulWidget {
  final dynamic nextScreen;

  const DogListScreen({
    super.key,
    required this.nextScreen,
  });

  @override
  State<DogListScreen> createState() => _DogListScreenState();
}

class _DogListScreenState extends State<DogListScreen> {
  late OwnerModel owner;
  late DogModel dog;
  late ActiveDogModel activeDog;

  @override
  void initState() {
    super.initState();

  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
              'Seleccione Perrito'), // Use the passed parameter for the title
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: TeAppThemeData.appMargin),
          child: ListView(children: const [
            SizedBox(
              height: TeAppThemeData.generalGap,
            ),
            // TeCard(
            //   backgroundColor: TeAppColorPalette.grey,
            //   foregroundColor: TeAppColorPalette.darkBlue,
            //   nextScreen: widget.nextScreen,
            //   dog: null, // TODO 
            // )
          ]),
        ));
  }
}
