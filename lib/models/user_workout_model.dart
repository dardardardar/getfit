

import 'package:cloud_firestore/cloud_firestore.dart';

class UserWorkoutModel{
  final String name;
  final int calories;
  String? uid = '';
  final DateTime createdOn;

  UserWorkoutModel({
    required this.name,
    required this.calories,
    this.uid,
    required this.createdOn,
  });

  static UserWorkoutModel fromJson(Map<String, dynamic> json) => UserWorkoutModel(
    name: json['name'],
    calories: json['calories'],
    uid: json['uid'],
    createdOn: (json['created_on']as Timestamp).toDate(),
  );
  Map<String, dynamic> toJson() =>{
    'name': name,
    'calories': calories,
    'uid': uid,
    'created_on': createdOn,
  };
}