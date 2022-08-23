import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getfit/models/consultant_model.dart';
import 'package:getfit/models/user_info_model.dart';

import '../models/user_model.dart';
import '../widgets/snackbar_widgets.dart';

class UserController{
  Future signUp(String email, String password, UserModel userModel) async{
    try{
      final res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:email,
          password: password
      );
      String? uid = res.user?.uid;
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      userModel.uid = uid;
      final json = userModel.toJson();
      userDoc.set(json);
      var userinfo = userDoc.collection('user_infos').doc(uid);
      int targetCalories = userModel.gender == 0 ?
        ((10 * userModel.weight) + (6.25 * userModel.height) - (5 * (DateTime.now().year - userModel.dob.year) + 5)).round() :
        ((10 * userModel.weight) + (6.25 * userModel.height) - (5 * (DateTime.now().year - userModel.dob.year) - 161)).round();
      var diet = targetCalories + 250;
      var maintain = targetCalories;
      var lose = targetCalories - 250;
      var targetCaloriesbyGoal = userModel.goalCategories == 0 ? diet : userModel.goalCategories == 1 ? maintain : lose;
      var userinfomodel = UserInfoModel(
          uid: uid,
          targetCalories: targetCaloriesbyGoal,
          targetCarbs:(( targetCaloriesbyGoal / 3) / 4).round(),
          targetFat: (( targetCaloriesbyGoal / 3) / 9).round(),
          targetProtein: (( targetCaloriesbyGoal / 3) / 4).round(),
          userCalories: targetCaloriesbyGoal,
          userCarbs: 0,
          userFat: 0,
          userProtein: 0);
      final json2 = userinfomodel.toJson();
      userinfo.set(json2);

      if(userModel.roles == 1){
        final _consultant = ConsultantModel(
            uid: uid,
            displayName: userModel.displayName,
            avatarUrl: userModel.avatarUrl,
            experience: 0,
            price: 0,
            rating: 0
        );
        final cnsDoc = FirebaseFirestore.instance.collection('consultants').doc(uid);
        final _json = _consultant.toJson();
        cnsDoc.set(_json);
      }
    }
    on FirebaseAuthException catch (e){
      print(e);
      SnackBarWidgets.fire(e.message);
    }
  }

  Future signIn(String email, String password) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
    }
    on FirebaseAuthException catch (e){
      print(e);
      SnackBarWidgets.fire(e.message);
    }

  }
  Future updateUserData(UserModel model)async {
    try{
      var user = FirebaseAuth.instance.currentUser!;
      String? uid = user.uid;
      var _doc =  FirebaseFirestore.instance.collection("users").doc(uid);
      final _json = model.toJson();
      _doc.set(_json);
      return SnackBarWidgets.success("Success");
    }
    on FirebaseAuthException catch (e){
      print(e);
      return SnackBarWidgets.fire(e.message);
    }
  }

  void signOut() async{
       await FirebaseAuth.instance.signOut();
  }
  Future updateGoal(int id) async {
    try{
      var uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).update({'goal_categories': id});
      return SnackBarWidgets.success("Success");
    }
    on FirebaseAuthException catch (e){
      print(e);
      return SnackBarWidgets.fire(e.message);
    }
  }
  Future<UserModel> readUserDatabyId({String? id}) async{
   try{
     var user = FirebaseAuth.instance.currentUser!;
     var _doc =  FirebaseFirestore.instance.collection("users").doc(user.uid);
     if(id != null){
       _doc =  FirebaseFirestore.instance.collection("users").doc(id);
     }
     var _res = await _doc.get();
     if(_res.exists){
       var _data = UserModel.fromJson(_res.data()!);
       return _data;
     }
     return UserModel(email: "", displayName: "", goalCategories: 0, gender: 0, dob: DateTime.now(), height: 0, weight: 0,roles: 0, avatarUrl: "");
   }
   on FirebaseException catch (e){
     print(e);
     return UserModel(email: "", displayName: "", goalCategories: 0, gender: 0, dob: DateTime.now(), height: 0, weight: 0,roles: 0,avatarUrl: "");
   }
  }

}