import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class OwnerModel {
  final String id;  // Firestore document ID
  final String name;
  final String lastName;
  final int phoneNumber;
  final int secondaryPhoneNumber;
  final DateTime? birthDate;
  final String address;
  final String profilePhotoPath;
  final List<String> dogs;

  OwnerModel({
    required this.id,  // Now including id field
    required this.profilePhotoPath,
    required this.name,
    required this.lastName,
    required this.phoneNumber,
    required this.secondaryPhoneNumber,
    required this.birthDate,
    required this.address,
    required this.dogs,
  });

  // Factory constructor to create an instance from Firestore document
  factory OwnerModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return OwnerModel(
      id: doc.id,  // Firestore document ID
      name: data['ownerName'] ?? '',
      lastName: data['ownerLastName'] ?? '',
      phoneNumber: data['ownerPhoneNumber'] ?? 0,
      secondaryPhoneNumber: data['ownerSecondaryPhoneNumber'] ?? 0,
      birthDate: data['ownerBirthDate'] != null
          ? (data['ownerBirthDate'] as Timestamp).toDate()
          : null,
      address: data['ownerHomeAddress'] ?? '',
      dogs: List<String>.from(data['ownerDogs'] ?? []),
      profilePhotoPath: data['ownerProfilePicturePath'] ?? '',
    );
  }

  // Factory constructor to create an instance from a Map
  factory OwnerModel.fromMap(String id, Map<String, dynamic> data) {
    return OwnerModel(
      id: id,  // Passed document ID
      name: data['ownerName'] ?? '',
      lastName: data['ownerLastName'] ?? '',
      phoneNumber: data['ownerPhoneNumber'] ?? 0,
      secondaryPhoneNumber: data['ownerSecondaryPhoneNumber'] ?? 0,
      birthDate: data['ownerBirthDate'] != null
          ? (data['ownerBirthDate'] as Timestamp).toDate()
          : null,
      address: data['ownerHomeAddress'] ?? '',
      dogs: List<String>.from(data['ownerDogs'] ?? []),
      profilePhotoPath: data['ownerProfilePicturePath'] ?? '',
    );
  }
}
