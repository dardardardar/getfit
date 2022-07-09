import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

  String? uid;
  final String email;
  final String displayName;
  final int goalCategories;
  final int gender;
  final DateTime dob;
  final int height;
  final int weight;
  final int roles;
  final String avatarUrl;
  UserModel({
    this.uid = '',
    required this.email,
    required this.displayName,
    required this.goalCategories,
    required this.gender,
    required this.dob,
    required this.height,
    required this.weight,
    required this.roles,
    required this.avatarUrl,
});

  Map<String , dynamic> toJson() =>{
    'uid': uid,
    'email': email,
    'displayName': displayName,
    'goalCategories': goalCategories,
    'gender': gender,
    'dob': dob,
    'height': height,
    'weight': weight,
    'roles': roles,
    'avatarUrl': avatarUrl,
  };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'],
    email: json['email'],
    displayName: json['displayName'],
    goalCategories: json['goalCategories'],
    gender: json['gender'],
    dob: (json['dob'] as Timestamp).toDate(),
    height: json['height'],
    weight: json['weight'],
    roles: json['roles'],
    avatarUrl: json['avatarUrl'],
  );

}