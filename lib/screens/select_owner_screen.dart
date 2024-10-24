import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawhouse_admin_alpha_app/assets/app_color_palette.dart';
import 'package:pawhouse_admin_alpha_app/models/owner_model.dart';
import 'package:pawhouse_admin_alpha_app/widgets/te_owner_card.dart';
import '../assets/app_theme.dart';
import 'create_owner_screen.dart';

class SelectOwnerScreen extends StatefulWidget {
  const SelectOwnerScreen({super.key});

  @override
  State<SelectOwnerScreen> createState() => _SelectOwnerScreenState();
}

class _SelectOwnerScreenState extends State<SelectOwnerScreen> {
  final CollectionReference _dogsCollection = FirebaseFirestore.instance.collection('users_profiles');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar Dueño'), actions: <Widget>[
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.squarePlus, size: 24),
          tooltip: 'Show Snackbar',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateOwnerProfileScreen(),
            ),
          ),
        ),
      ]),
      body: StreamBuilder<QuerySnapshot>(
        stream: _dogsCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error cargando informacion', style: TextStyle(color: TeAppColorPalette.darkBlue)),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No hay dueños registrados', style: TextStyle(color: TeAppColorPalette.darkBlue)),
            );
          }

          final owners = snapshot.data!.docs.map((doc) {
            return OwnerModel.fromFirestore(doc);
          }).toList();

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns
              crossAxisSpacing: 0, // Horizontal spacing
              mainAxisSpacing: TeAppThemeData.generalGap / 2,  // Vertical spacing
            ),
            itemCount: owners.length,
            itemBuilder: (BuildContext context, int index) {
              final theOwner = owners[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context, theOwner); // Return selected owner
                },
                child: Padding(
                  padding: const EdgeInsets.all(TeAppThemeData.generalGap),
                  child: TeOwnerCard(owner: theOwner),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
