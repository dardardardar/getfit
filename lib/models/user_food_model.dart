
import 'package:cloud_firestore/cloud_firestore.dart';

class UserFoodModel{
  final String name;
  final int calories;
  final int fat;
  final int protein;
  final int carbohydrates;
  String? uid = '';
  final DateTime createdOn;
  final String tag;

  UserFoodModel({
    required this.name,
    required this.calories,
    required this.fat,
    required this.protein,
    required this.carbohydrates,
    this.uid,
    required this.createdOn,
    required this.tag,
  });

  static UserFoodModel fromJson(Map<String, dynamic> json) => UserFoodModel(
    name: json['name'],
    calories: json['calories'],
    fat: json['fat'],
    protein: json['protein'],
    carbohydrates: json['carbs'],
    uid: json['uid'],
    createdOn: (json['created_on']as Timestamp).toDate(),
    tag: json['tag'],
  );

  Map<String, dynamic> toJson() =>{
    'name': name,
    'calories': calories,
    'fat': fat,
    'protein': protein,
    'carbs': carbohydrates,
    'uid': uid,
    'created_on': createdOn,
    'tag': tag,
  };
}