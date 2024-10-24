import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_color_palette.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_theme.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_button.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_container.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_dropdown_menu.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/owner_model.dart'; // Import the OwnerModel
import '../widgets/te_bottom_button.dart';
import 'select_owner_screen.dart';

class CreateDogProfileScreen extends StatefulWidget {
  const CreateDogProfileScreen({super.key});

  @override
  State<CreateDogProfileScreen> createState() => _CreateDogProfileScreenState();
}

class _CreateDogProfileScreenState extends State<CreateDogProfileScreen> {
  String selectSex = 'Macho';
  List<String> sexDropdownMenu = ['Hembra', 'Macho'];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController allergiesController = TextEditingController();
  final TextEditingController favoriteActivitiesController =
      TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  final TextEditingController veterinaryController = TextEditingController();

  DateTime selectedDayOfBirth = DateTime.utc(2024, 05, 07);

  OwnerModel? selectedOwner; // Variable to store the selected owner

  Future<void> _selectOwner() async {
    final OwnerModel? owner = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectOwnerScreen()),
    );
    if (owner != null) {
      setState(() {
        selectedOwner = owner; // Update state with the selected owner
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    setState(() {
      if (picked != null) {
        selectedDayOfBirth = picked;
      }
    });
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
        title: const Text('Crear Perfil Del Peludo'),
      ),
      body: Stack(
        children: [ 
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: TeAppThemeData.appMargin),
              child: Column(
                children: [
                  const SizedBox(height: TeAppThemeData.appMargin),

                  GestureDetector(
                    onTap: () {
                      // Add your onTap action here
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: TeAppColorPalette.darkBlue,
                      ),
                      child: const Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidImage,
                              size: 100,
                              color: Colors.white, // Color of the image icon
                            ),
                            Positioned(
                              top: 14,
                              right: 12,
                              child: FaIcon(
                                FontAwesomeIcons.plus,
                                size: 22,
                                color: Colors.white, // Color of the plus sign
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: TeAppThemeData.generalGap),

                  // 'Seleccionar Dueño' button
                  TeButton(
                    elevation: 0,
                    color: TeAppColorPalette.blueGreeny,
                    buttonAction: _selectOwner, // Trigger owner selection
                    childWidget: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
  selectedOwner != null
    ? (selectedOwner!.name.split(' ').length >= 2
        ? selectedOwner!.name.split(' ').sublist(0, 2).join(' ') // First name and first last name
        : selectedOwner!.name) // If there's only one part, display the whole name
    : 'Seleccionar Dueño',
  style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
),

                          const FaIcon(FontAwesomeIcons.arrowRight,
                              size: TeAppThemeData.iconArrowSize)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeTextField(
                    labelText: 'Nombre Del Peludo',
                    controller: nameController,
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeTextField(
                    labelText: 'Raza Del Peludo',
                    controller: breedController,
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeDropDownMenu(
                    context: context,
                    value: selectSex,
                    items: sexDropdownMenu,
                    onChanged: (newValue) {
                      setState(() {
                        selectSex = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          child: TeTextField(
                            suffixStyle: const TextStyle(
                                color: TeAppColorPalette.darkBlue,
                                fontWeight: FontWeight.w900),
                            suffixText: 'Kg',
                            labelText: 'Peso',
                            textInputType: TextInputType.number,
                            textInputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: weightController,
                          ),
                        ),
                        const SizedBox(width: TeAppThemeData.generalGap),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context),
                            child: AbsorbPointer(
                              child: TeContainer(
                                borderWidth: 4,
                                elevation: 0,
                                borderColor: TeAppColorPalette.darkBlue,
                                color: TeAppColorPalette.white,
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 4),
                                  child: Text(
                                    selectedDayOfBirth ==
                                            DateTime.utc(2024, 05, 07)
                                        ? 'Nacimiento'
                                        : DateFormat('yyyy/MM/dd')
                                            .format(selectedDayOfBirth),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            color: TeAppColorPalette.darkBlue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeTextField(
                    labelText: 'Veterinaria De Confianza',
                    controller: veterinaryController,
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeTextField(
                    labelText: 'Alergias',
                    height: 100,
                    controller: allergiesController,
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeTextField(
                    labelText: 'Actividades Favoritas?',
                    height: 100,
                    controller: favoriteActivitiesController,
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeTextField(
                    labelText: 'Comentarios?',
                    height: 100,
                    controller: commentsController,
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  const SizedBox(height: 100),
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
                buttonAction: () {
                  _showConfirmationDialog(context); // Show confirmation dialog
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Confirmar'),
          content: const Text('¿Estás seguro de que deseas crear este perfil?'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: false,
              textStyle: const TextStyle(color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('Crear'),
              onPressed: () async {
                Navigator.of(context).pop();
                await uploadDogProfileData();
                // ignore: use_build_context_synchronously
                Navigator.of(context).popUntil((route) => route.isFirst);
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Perfil creado con éxito.')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> uploadDogProfileData() async {
    // Create a document reference
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('dog_profiles').doc();

    // Data to upload
    Map<String, dynamic> dogProfileData = {
      'dogBirthDate': selectedDayOfBirth,
      'dogBreed': breedController.text.trim(),
      'dogComments': commentsController.text.trim(),
      'dogFavouriteActivites': favoriteActivitiesController.text.trim(),
      'dogGender': selectSex,
      'dogName': nameController.text.trim(),
      'dogOwnerID': selectedOwner != null
          ? selectedOwner!.id
          : 'Todo', // Store selected owner ID
      'dogPhotoPath': '',
      'dogVeterinary': veterinaryController.text.trim(),
      'dogWeight': weightController.text.trim(),
    };

    // Upload data to Firestore
    await docRef.set(dogProfileData);
  }
}
