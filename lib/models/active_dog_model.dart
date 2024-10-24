import 'dart:core';
import 'dog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActiveDogModel {
  final DogModel? info;
  final double startingWeight;
  final List<String> listOfBelongings;
  final DateTime? arrivingDate;  
  final DateTime? departureDate; 
  final String dinamicID;

  ActiveDogModel({
    required this.info,
    required this.startingWeight,
    required this.listOfBelongings,
    this.arrivingDate,
    this.departureDate,
    required this.dinamicID,
  });

  factory ActiveDogModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    final arrivingDate = data['arrivingDate'] is Timestamp
        ? (data['arrivingDate'] as Timestamp).toDate()
        : null;
    final departureDate = data['departureDate'] is Timestamp
        ? (data['departureDate'] as Timestamp).toDate()
        : null;

    return ActiveDogModel(
      info: data['info'] != null ? DogModel.fromMap(data['info']) : null,
      startingWeight: (data['startingWeight'] as num?)?.toDouble() ?? 0.0,
      listOfBelongings: List<String>.from(data['listOfBelongings'] ?? []),
      arrivingDate: arrivingDate,
      departureDate: departureDate,
      dinamicID: data['dinamicID'] ?? '',
    );
  }
}
