import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

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
    }
  }
  // Future setUserDoc(UserModel userModel) async{
  //   await FirebaseAuth.instance
  //       .authStateChanges()
  //       .listen((User? user)  {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       print('User is signed in!');
  //       String? uid = user.uid;
  //       final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
  //       userModel.uid = uid;
  //       final json = userModel.toJson();
  //       userDoc.set(json);
  //     }
  //   });
  // }


}