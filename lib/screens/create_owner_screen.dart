// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_color_palette.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_theme.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_button.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/te_bottom_button.dart';
import '../widgets/te_container.dart';
import '../widgets/te_dropdown_menu.dart';

class CreateOwnerProfileScreen extends StatefulWidget {
  const CreateOwnerProfileScreen({super.key});

  @override
  State<CreateOwnerProfileScreen> createState() =>
      _CreateOwnerProfileScreenState();
}

class _CreateOwnerProfileScreenState extends State<CreateOwnerProfileScreen> {
  String selectGender = 'Hombre'; // Default is 'Hombre'
  List<String> genderDropdownMenu = ['Hombre', 'Mujer'];
  File? _selectedImage; // File for the selected image
  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController secondaryPhoneController = TextEditingController();
  final TextEditingController homeAddressController = TextEditingController();

  DateTime selectedBirthDate = DateTime.now();

  Future<void> pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<String> uploadImageToFirebase(File image, String documentId) async {
    // Use the Firestore document ID as the name of the image file
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('owner_profile_pictures/$documentId.jpg');

    final uploadTask = storageRef.putFile(image);
    final snapshot = await uploadTask.whenComplete(() => {});
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> uploadOwnerProfileData() async {
    // Create a Firestore document reference and get the document ID
    DocumentReference docRef = FirebaseFirestore.instance.collection('users_profiles').doc();
    String documentId = docRef.id; // Get the document ID

    // Upload the selected image to Firebase Storage using the document ID as the filename
    String profilePictureUrl = '';
    if (_selectedImage != null) {
      profilePictureUrl = await uploadImageToFirebase(_selectedImage!, documentId);
    }

    // Data to upload to Firestore
    Map<String, dynamic> ownerProfileData = {
      'ownerName': nameController.text.trim(),
      'ownerLastName': lastNameController.text.trim(),
      'ownerPhoneNumber': int.tryParse(phoneController.text.trim()) ?? 0,
      'ownerSecondaryPhoneNumber': int.tryParse(secondaryPhoneController.text.trim()) ?? 0,
      'ownerGender': selectGender, // 'Hombre' or 'Mujer'
      'ownerBirthDate': Timestamp.fromDate(selectedBirthDate),
      'ownerHomeAdress': homeAddressController.text.trim(),
      'ownerProfilePicturePath': profilePictureUrl, // URL of the uploaded image
      'ownerDogs': [], // Empty array for now
    };

    // Upload the owner profile data to Firestore
    await docRef.set(ownerProfileData);
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

                // Upload profile data
                await uploadOwnerProfileData();

                if (mounted) {
                  // Ensure widget is still mounted before navigating or showing a SnackBar
                  Navigator.of(context).popUntil((route) => route.isFirst);

                  // Ensure widget is still mounted before showing a SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Perfil de dueño creado con éxito.')),
                  );
                }
              },
            ),
          ],
        );
      },
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
        title: const Text('Crear Perfil Del Dueño'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: TeAppThemeData.appMargin),
              child: Column(
                children: [
                  const SizedBox(height: TeAppThemeData.appMargin),
                  GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Container(
                    height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: TeAppColorPalette.darkBlue,
                      ),
                      child: Center(
                        child: _selectedImage == null
                            ? const Stack(
                                alignment: Alignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.solidImage,
                                    size: 100,
                                    color: Colors.white, // Image icon color
                                  ),
                                  Positioned(
                                    top: 14,
                                    right: 12,
                                    child: FaIcon(
                                      FontAwesomeIcons.plus,
                                      size: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(_selectedImage!),
                                radius: 100,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeTextField(
                    labelText: 'Nombre',
                    controller: nameController,
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeTextField(
                    labelText: 'Apellido',
                    controller: lastNameController,
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeTextField(
                    labelText: 'Teléfono',
                    textInputType: TextInputType.number,
                    textInputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: phoneController,
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeTextField(
                    labelText: 'Teléfono Secundario',
                    textInputType: TextInputType.number,
                    textInputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: secondaryPhoneController,
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeDropDownMenu(
                    context: context,
                    value: selectGender, // 'Hombre' or 'Mujer'
                    items: genderDropdownMenu,
                    onChanged: (newValue) {
                      setState(() {
                        selectGender = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: TeAppThemeData.generalGap),
                  TeTextField(
                    labelText: 'Dirección de Casa',
                    controller: homeAddressController,
                  ),
                  const SizedBox(height: 100),
                  const SizedBox(height: TeAppThemeData.generalGap),
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
}
