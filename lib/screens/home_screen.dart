// ignore_for_file: prefer_const_constructors, empty_catches
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_color_palette.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_theme.dart';
import 'package:pawhouse_admin_alpha_app/models/active_dog_model.dart';
import 'package:pawhouse_admin_alpha_app/models/dog_model.dart';
import 'package:pawhouse_admin_alpha_app/models/owner_model.dart';
import 'package:pawhouse_admin_alpha_app/screens/check_in_screen.dart';
import 'package:pawhouse_admin_alpha_app/screens/create_dog_profile_screen.dart';
import 'package:pawhouse_admin_alpha_app/screens/overview_screen.dart';
import 'package:pawhouse_admin_alpha_app/screens/reserve_screen.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_container.dart';
import '../widgets/te_dog_card.dart';
import 'dog_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference _referenceActiveDogs =
      FirebaseFirestore.instance.collection('active_dogs');

  final GlobalKey<FabCircularMenuPlusState> fabKey = GlobalKey();
  late Future<List<ActiveDogModel>> futureActiveDogs;

  @override
  void initState() {
    super.initState();
    futureActiveDogs = fetchActiveDogs();
  }

  Future<List<ActiveDogModel>> fetchActiveDogs() async {
    List<ActiveDogModel> fetchedDogs = [];
    try {
      QuerySnapshot activeDogsSnapshot = await _referenceActiveDogs.get();

      print("Documents retrieved: ${activeDogsSnapshot.docs.length}");

      for (var doc in activeDogsSnapshot.docs) {
        var activeDogData = doc.data() as Map<String, dynamic>?;
        print("Active Dog Data: $activeDogData");

        if (activeDogData == null) {
          continue; // Skip if the document data is null
        }

        // Ensure that dogID is not empty
        String? dogID = activeDogData['dogID'];
        if (dogID == null || dogID.isEmpty) {
          print("Missing dogID for document: ${doc.id}");
          continue; // Skip if dogID is null or empty
        }

        // Fetch the associated dog and owner data
        DocumentSnapshot dogSnapshot = await FirebaseFirestore.instance
            .collection('dog_profiles')
            .doc(dogID)
            .get();
        var dogData = dogSnapshot.data() as Map<String, dynamic>?;
        print("Dog Data for dogID $dogID: $dogData");

        if (dogData == null) {
          print("Missing dog data for dogID: $dogID");
          continue; // Skip if the dog data is null
        }

        // Ensure that ownerID is not empty
        String? ownerID = dogData['dogOwnerID'];
        if (ownerID == null || ownerID.isEmpty) {
          print("Missing ownerID for dogID: $dogID");
          continue; // Skip if ownerID is null or empty
        }

        DocumentSnapshot ownerSnapshot = await FirebaseFirestore.instance
            .collection('users_profiles')
            .doc(ownerID)
            .get();
        var ownerData = ownerSnapshot.data() as Map<String, dynamic>?;
        print("Owner Data for ownerID $ownerID: $ownerData");

        if (ownerData == null) {
          print("Missing owner data for ownerID: $ownerID");
          continue; // Skip if the owner data is null
        }
// Helper function to handle ownerDogs field
        List<String> handleOwnerDogs(dynamic dogsField) {
          print("Raw ownerDogs data: $dogsField"); // Debugging output
          // Ensure that dogsField is always treated as a list of strings
          if (dogsField is List) {
            return dogsField.map((dog) => dog.toString()).toList();
          } else {
            print("Error: ownerDogs is not an array!");
            return []; // Default to an empty list if the data is not in the expected format
          }
        }

        OwnerModel owner = OwnerModel(
          id: ownerSnapshot.id,
          name: ownerData['ownerName'] ?? '',
          lastName: ownerData['ownerLastName'] ?? '',
          phoneNumber: ownerData['ownerPhoneNumber'] ?? 0,
          secondaryPhoneNumber: ownerData['ownerSecondaryPhoneNumber'] ?? 0,
          birthDate: (ownerData['ownerBirthDate'] as Timestamp?)?.toDate() ??
              DateTime.now(),
          address: ownerData['ownerHomeAdress'] ?? '',

          // Add this debug logging before the array processing
          dogs: handleOwnerDogs(ownerData['ownerDogs']),

          profilePhotoPath: ownerData['ownerProfilePicturePath'] ?? '',
        );

        DogModel dog = DogModel(
          owner: owner,
          name: dogData['dogName'] ?? '',
          breed: dogData['dogBreed'] ?? '',
          weight: double.tryParse(dogData['dogWeight']) ?? 0.0,
          gender: dogData['dogGender'] ?? '',
          birthDate: (dogData['dogBirthDate'] as Timestamp?)?.toDate() ??
              DateTime.now(),
          favoriteActivities:
              List<String>.from(dogData['dogFavouriteActivites'] ?? []),
          comments: List<String>.from(dogData['dogComments'] ?? []),
          profilePhotoPath: dogData['dogPhotoPath'] ?? '',
        );

        ActiveDogModel activeDog = ActiveDogModel(
          info: dog,
          startingWeight: activeDogData['dogStartingWeight'] ?? 0.0,
          listOfBelongings:
              List<String>.from(activeDogData['dogBelongings'] ?? []),
          arrivingDate:
              (activeDogData['dogArrivingDate'] as Timestamp?)?.toDate() ??
                  DateTime.now(),
          departureDate:
              (activeDogData['dogDeparturaDate'] as Timestamp?)?.toDate() ??
                  DateTime.now(),
          dinamicID: activeDogData['dogDinamicID'] ?? '',
        );

        fetchedDogs.add(activeDog);
      }

      print("Fetched Dogs Count: ${fetchedDogs.length}");
    } catch (e) {
      print("Error fetching active dogs: $e");
    }

    return fetchedDogs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TeFab(
        fabKey: fabKey,
        activeDog: null,
      ),
      appBar: AppBar(
        title: const Text('Pawhouse\'s Alpha App'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
                top: TeAppThemeData.appMargin,
                bottom: 0,
                left: TeAppThemeData.appMargin,
                right: TeAppThemeData.appMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OverviewCardWidget(),
                SizedBox(
                  height: TeAppThemeData.generalGap,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TodoCardWidget(),
                    SizedBox(
                      width: TeAppThemeData.generalGap,
                    ),
                    VideosCardWidget(),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: TeAppThemeData.appMargin),
          FutureBuilder<List<ActiveDogModel>>(
            future: futureActiveDogs,
            builder: (BuildContext context,
                AsyncSnapshot<List<ActiveDogModel>> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.data!.isEmpty) {
                return SizedBox(
                  child: Center(
                      child: Text(
                    'No active dogs.',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: TeAppColorPalette.darkBlue),
                  )),
                );
              }

              if (!snapshot.hasData) {
                return Center(
                    child: Text(
                  'No data',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: TeAppColorPalette.darkBlue),
                ));
              }

              return GuestlistWidget(activeDogs: snapshot.data ?? []);
            },
          ),
        ],
      ),
    );
  }
}

class GuestlistWidget extends StatelessWidget {
  const GuestlistWidget({
    super.key,
    required this.activeDogs,
  });

  final List<ActiveDogModel> activeDogs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: TeAppColorPalette.darkBlue,
            borderRadius: BorderRadius.only(
                topLeft:
                    Radius.circular(TeAppThemeData.generalBorderRadius * 1.5),
                topRight:
                    Radius.circular(TeAppThemeData.generalBorderRadius * 1.5))),
        height: double.infinity,
        child: Flex(
          direction: Axis.vertical,
          children: [
            SizedBox(height: TeAppThemeData.appMargin + 8),
            Text('Lista De Huespedes',
                style: Theme.of(context).textTheme.displayLarge),
            SizedBox(height: TeAppThemeData.appMargin),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: TeAppThemeData.appMargin,
                ),
                child: ShaderMask(
                  shaderCallback: (Rect rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.purple,
                        Colors.transparent,
                        Colors.transparent,
                      ],
                      stops: [
                        0.0,
                        0.05,
                        1.0,
                      ],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListView.builder(
                      itemCount: activeDogs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final activeDog = activeDogs[index];
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: TeAppThemeData.generalGap),
                          child: TeDogCard(
                            backgroundColor: TeAppColorPalette.grey,
                            foregroundColor: TeAppColorPalette.darkBlue,
                            nextScreen: DogProfileScreen(
                              activeDog: activeDog,
                            ),
                            dog: activeDog,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideosCardWidget extends StatelessWidget {
  const VideosCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TeContainer(
        padding: EdgeInsets.only(
            left: TeAppThemeData.containerPaddingHorizontral,
            right: TeAppThemeData.containerPaddingVertical,
            top: TeAppThemeData.containerPaddingVertical,
            bottom: 0),
        width: double.infinity,
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Videos',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: TeAppColorPalette.white),
                ),
                FaIcon(FontAwesomeIcons.arrowRight,
                    size: TeAppThemeData.iconArrowSize)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: TeAppThemeData.containerPaddingVertical),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: TeAppThemeData.textBigGap,
                      ),
                      Text(
                        'Molly',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: TeAppColorPalette.white),
                      ),
                      SizedBox(
                        height: TeAppThemeData.textSmallGap,
                      ),
                      Text('Choco',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: TeAppColorPalette.white.withOpacity(.8),
                                decoration: TextDecoration.lineThrough,
                              )),
                      SizedBox(
                        height: TeAppThemeData.textSmallGap,
                      ),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: const [
                              TeAppColorPalette.white,
                              Colors.transparent
                            ],
                            stops: const [
                              0.45,
                              1.0
                            ], // Adjust the stops to control the fade effect
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstIn,
                        child: Text(
                          'Minato',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: TeAppColorPalette.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/images/videosDiarios.png'),
                        height: 86,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        gradient: LinearGradient(
          colors: const [TeAppColorPalette.blue, TeAppColorPalette.blueGreeny],
          stops: const [0.4, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}

class TodoCardWidget extends StatelessWidget {
  const TodoCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TeContainer(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'To-Do',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(color: TeAppColorPalette.white),
              ),
              SizedBox(
                width: TeAppThemeData.generalGap * 2,
              ),
              FaIcon(FontAwesomeIcons.arrowRight,
                  size: TeAppThemeData.iconArrowSize)
            ],
          ),
          SizedBox(
            height: TeAppThemeData.textBigGap,
          ),
          Text('Desayuno',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: TeAppColorPalette.white.withOpacity(.8),
                    decoration: TextDecoration.lineThrough,
                  )),
          SizedBox(
            height: TeAppThemeData.textSmallGap,
          ),
          Text(
            'Medicinas',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: TeAppColorPalette.white),
          ),
          SizedBox(
            height: TeAppThemeData.textSmallGap,
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [TeAppColorPalette.white, Colors.transparent],
                stops: const [
                  0.45,
                  1.0
                ], // Adjust the stops to control the fade effect
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Text(
              'Paseos',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: TeAppColorPalette.white),
            ),
          ),
        ],
      ),
      color: TeAppColorPalette.blueGreeny,
    );
  }
}

class OverviewCardWidget extends StatelessWidget {
  const OverviewCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TeContainer(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => OverviewScreen())),
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Overview',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(color: TeAppColorPalette.white),
              ),
              FaIcon(FontAwesomeIcons.arrowRight,
                  size: TeAppThemeData.iconArrowSize)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Peludos En Total:',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: TeAppColorPalette.white),
              ),
              Text(
                '24',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: TeAppColorPalette.white),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Peludos Que Llegaran:',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: TeAppColorPalette.white),
              ),
              Text(
                '5',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: TeAppColorPalette.white),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Peludos Que Se Iran:',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: TeAppColorPalette.white),
              ),
              Text(
                '12',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: TeAppColorPalette.white),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingresos De Hoy:',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: TeAppColorPalette.white),
                ),
                Text(
                  '\$2,400',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: TeAppColorPalette.white),
                ),
              ],
            ),
          )
        ],
      ),
      color: TeAppColorPalette.blue,
      width: double.infinity,
    );
  }
}

class TeFab extends StatelessWidget {
  const TeFab({
    super.key,
    required this.fabKey,
    this.activeDog,
  });

  final GlobalKey<FabCircularMenuPlusState> fabKey;
  final ActiveDogModel? activeDog;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => FabCircularMenuPlus(
        key: fabKey,
        alignment: Alignment.bottomRight,
        ringColor: TeAppColorPalette.blueGreeny.withOpacity(.8),
        ringDiameter: 500.0,
        ringWidth: 120.0,
        fabSize: 80.0,
        fabElevation: 8.0,
        fabIconBorder: const CircleBorder(),
        fabColor: TeAppColorPalette.blueGreeny,
        fabOpenColor: TeAppColorPalette.blueGreeny,
        fabCloseColor: TeAppColorPalette.blueGreeny,
        fabOpenIcon: FaIcon(
          FontAwesomeIcons.screwdriverWrench,
          size: 22,
        ),
        fabCloseIcon: FaIcon(
          FontAwesomeIcons.xmark,
          size: 22,
        ),
        fabMargin: const EdgeInsets.all(16.0),
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.decelerate,
        onDisplayChange: (isOpen) {},
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckInScreen(),
                ),
              );
            },
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: FaIcon(
              FontAwesomeIcons.arrowRightToBracket,
              size: 24,
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReserveScreen(),
                ),
              );
            },
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: FaIcon(
              FontAwesomeIcons.solidCalendarPlus,
              size: 24,
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateDogProfileScreen()));
            },
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: FaIcon(
              FontAwesomeIcons.userPlus,
              size: 24,
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => DogListScreen(
              //               nextScreen: CheckOutScreen(
              //                 dog: activeDog,
              //               ),
              //             )));
            },
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: FaIcon(
              FontAwesomeIcons.receipt,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
