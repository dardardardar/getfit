import 'package:firebase_core/firebase_core.dart';
import 'package:getfit/models/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getfit/models/chats_model.dart';
import 'package:getfit/models/user_info_model.dart';
import 'package:getfit/models/workout_model.dart';
import 'package:getfit/widgets/snackbar_widgets.dart';
import '../models/consultant_model.dart';
import '../models/message_model.dart';
import '../models/user_food_model.dart';
import '../models/user_workout_model.dart';

class HomeController{

  var uid = FirebaseAuth.instance.currentUser!.uid;

  Future<List<FoodModel>> getFoodList() async {
    var _query = await FirebaseFirestore.instance.collection("foods").orderBy('name').get();
    List<FoodModel> _result = _query.docs.map((e) => FoodModel.fromJson(e.data())).toList();
    return _result;
  }

  Stream<List<UserFoodModel>> getFoods({String? tag})  {
    var time = DateTime.now();
    var newDate= DateTime(time.year, time.month, time.day, 0, 0, 0, 0, 0);
    if(tag != null){
      return  FirebaseFirestore.instance.collection("user_foods")
          .where('uid', isEqualTo: uid)
          .where('tag', isEqualTo: tag)
          .where('created_on',isGreaterThan: newDate )
          .snapshots().map((
          sn) {
        return sn.docs.map((e) => UserFoodModel.fromJson(e.data())).toList();
      });
    }
    return  FirebaseFirestore.instance.collection("user_foods")
        .where('uid', isEqualTo: uid)
        .where('created_on',isGreaterThan: newDate )
        .snapshots().map((
        sn) {
      return sn.docs.map((e) => UserFoodModel.fromJson(e.data())).toList();
    });
  }

  Future<List<WorkoutModel>> getExerciseList() async {
    var _query = await FirebaseFirestore.instance.collection("exercises").orderBy('name').get();
    List<WorkoutModel> _result = _query.docs.map((e) => WorkoutModel.fromJson(e.data())).toList();
    return _result;
  }

  Stream<List<UserWorkoutModel>> getExercises()  {
    var time = DateTime.now();
    var newDate= DateTime(time.year, time.month, time.day, 0, 0, 0, 0, 0);
    return  FirebaseFirestore.instance
        .collection("user_workout")
        .where('uid', isEqualTo: uid)
        .where('created_on',isGreaterThanOrEqualTo: newDate)
        .snapshots().map((
        sn) {
      return sn.docs.map((e) => UserWorkoutModel.fromJson(e.data())).toList();
    });
  }

  Future addFoods(UserFoodModel model) async {
    var _query = FirebaseFirestore.instance.collection("user_foods");
    return await _query.add(model.toJson()).then((value) => SnackBarWidgets.success('Added "' + model.name + '" to list'));
  }

  Future<UserInfoModel> getUserInfo() async{
    var query =  await FirebaseFirestore.instance.collection("users").doc(uid).collection("user_infos").doc(uid).get();
    var model = UserInfoModel.fromJson(query.data()!);
    print(model.targetCalories);
    return model;

  }

  Future addExercises(UserWorkoutModel model) async {
    var _query = FirebaseFirestore.instance.collection("user_workout");
    return await _query.add(model.toJson()).then((value) => SnackBarWidgets.success('Added "' + model.name + '" to list'));
  }

  Future deleteFoods(UserFoodModel model) async {
    return await FirebaseFirestore.instance.collection("user_foods")
        .where('uid' ,isEqualTo: uid)
        .where('created_on', isEqualTo: model.createdOn).get().then((value) {
      for (var doc in value.docs) {
         doc.reference.delete();
      }
      return SnackBarWidgets.success('Deleted "' + model.name + '" to list');
    }).onError((error, stackTrace) {
      return SnackBarWidgets.fire(error.toString());
    });
  }

  Future deleteExercises(UserWorkoutModel model) async {
    return await FirebaseFirestore.instance.collection("user_workout")
        .where('uid' ,isEqualTo: uid)
        .where('created_on', isEqualTo: model.createdOn).get().then((value) {
      for (var doc in value.docs) {
        doc.reference.delete();
      }
      return SnackBarWidgets.success('Deleted "' + model.name + '" to list');
    }).onError((error, stackTrace) {
      return SnackBarWidgets.fire(error.toString());
    });
  }

}