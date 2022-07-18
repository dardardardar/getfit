import 'package:firebase_core/firebase_core.dart';
import 'package:getfit/models/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getfit/models/chats_model.dart';
import '../models/consultant_model.dart';
import '../models/message_model.dart';

class HomeController{
  Future<List<FoodModel>> getFoods() async {
    var _query = await FirebaseFirestore.instance.collection("foods").get();
    List<FoodModel> _result = _query.docs.map((e) => FoodModel.fromJson(e.data())).toList();
    return _result;
  }
}