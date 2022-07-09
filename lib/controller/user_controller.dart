import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    }
    on FirebaseAuthException catch (e){
      print(e);
      SnackBarWidgets.fire(e.message);
    }
  }

  Future<UserModel> readUserDatabyId() async{
   try{
     var user = FirebaseAuth.instance.currentUser!;
     String? uid = user.uid;
     var _doc =  FirebaseFirestore.instance.collection("users").doc(uid);
     var _res = await _doc.get();
     if(_res.exists){
       var _data = UserModel.fromJson(_res.data()!);
       return _data;
     }
     return UserModel(email: "", displayName: "", goalCategories: 0, gender: 0, dob: DateTime.now(), height: 0, weight: 0,roles: 0);
   }
   on FirebaseException catch (e){
     print(e);
     return UserModel(email: "", displayName: "", goalCategories: 0, gender: 0, dob: DateTime.now(), height: 0, weight: 0,roles: 0);
   }
  }


}