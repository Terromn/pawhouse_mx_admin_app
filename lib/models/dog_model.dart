import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawhouse_admin_alpha_app/models/owner_model.dart';

class DogModel {
  final OwnerModel? owner;
  final String name;
  final String gender;
  final String breed;
  final DateTime birthDate;
  final double weight;
  final String profilePhotoPath;
  final List<String> favoriteActivities;
  final List<String> comments;

  DogModel({
    required this.owner,
    required this.name,
    required this.breed,
    required this.weight,
    required this.gender,
    required this.birthDate,
    required this.favoriteActivities,
    required this.comments,
    required this.profilePhotoPath,
  });

  // Factory constructor to create a DogModel instance from Firestore data
  factory DogModel.fromMap(Map<String, dynamic> data) {
    return DogModel(
      // Passing a placeholder 'unknown' ID if not available, adjust as per your logic
      owner: data['owner'] != null ? OwnerModel.fromMap('unknown', data['owner']) : null,
      name: data['name'] ?? '',
      breed: data['breed'] ?? '',
      weight: (data['weight'] as num?)?.toDouble() ?? 0.0,
      gender: data['gender'] ?? false,
      birthDate: (data['birthDate'] as Timestamp).toDate(),
      favoriteActivities: List<String>.from(data['favoriteActivities'] ?? []),
      comments: List<String>.from(data['comments'] ?? []),
      profilePhotoPath: data['profilePhotoPath'] ?? '',
    );
  }
}
