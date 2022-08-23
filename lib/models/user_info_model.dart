import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoModel {
  String? uid;
  final int targetCalories;
  final int targetCarbs;
  final int targetFat;
  final int targetProtein;
  final int userCalories;
  final int userCarbs;
  final int userFat;
  final int userProtein;

  UserInfoModel({
    this.uid = '',
    required this.targetCalories,
    required this.targetCarbs,
    required this.targetFat,
    required this.targetProtein,
    required this.userCalories,
    required this.userCarbs,
    required this.userFat,
    required this.userProtein,
  });

  Map<String , dynamic> toJson() =>{
    'uid': uid,
    'target_calories': targetCalories,
    'target_carbs': targetCarbs,
    'target_fat': targetFat,
    'target_protein': targetProtein,
    'user_calories': userCalories,
    'user_carbs': userCarbs,
    'user_fat': userFat,
    'user_protein': userProtein,
  };

  static UserInfoModel fromJson(Map<String, dynamic> json) => UserInfoModel(
    uid: json['uid'],
    targetCalories: json['target_calories'],
    targetCarbs: json['target_carbs'],
    targetFat: json['target_fat'],
    targetProtein: json['target_protein'],
    userCalories: json['user_calories'],
    userCarbs: json['user_carbs'],
    userFat: json['user_fat'],
    userProtein: json['user_protein'],
  );

}