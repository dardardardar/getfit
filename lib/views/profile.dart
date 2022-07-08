import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/views/editprofileView.dart';
import 'package:getfit/views/mygoalView.dart';
import 'package:getfit/widgets/colors.dart';
import '../controller/user_controller.dart';
import '../models/user_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final userdata = UserController().readUserDatabyId();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel?>(
        future: userdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _data = snapshot.data;
            return Container(
                margin: EdgeInsets.all(12),
                child: SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    profileCard(_data!),
                    editprofileCard(context),
                    mygoalCard(context),
                    signOutButton(),
                  ],
                )));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

    );
  }
}

Widget profileCard(UserModel _data) {
  return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: LibColors.second_color,
        ),
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),

        child: Row(
          children: <Widget>[
            Container(
              child:
                CircleAvatar(
                  backgroundImage: null,
                  backgroundColor: LibColors.color_grey,
                  radius: 40,
                )
            ),
            SizedBox(width: 24,),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _data.displayName,

                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,

                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    (_data.goalCategories == 0)
                        ? "Diets"
                        : (_data.goalCategories == 1)
                            ? "Maintain Weight"
                            : "Lose Weight",
                    style: TextStyle(color: Colors.white),
                  ),

                ],
              ),
            ),
          ],
        ),
      );
}

Widget editprofileCard(context) {
  return MaterialButton(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => editprofileView()));
    },
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)),
    minWidth: double.infinity,
    color: LibColors.color_grey,
    child: Container(
      child: Text('Edit Profile'),
    ),
  );

}

Widget mygoalCard(context) {
  return MaterialButton(
    onPressed: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => MygoalView()));
    },
    minWidth: double.infinity,
    color: LibColors.color_grey,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)),

    child: Container(
      child: Text('My Goal'),
    ),
  );

}
Widget signOutButton(){
  return MaterialButton(
    minWidth: double.infinity,
    color: LibColors.danger_red,
    onPressed: () => FirebaseAuth.instance.signOut(),
    child: Text('Sign Out',style: TextStyle(color: LibColors.color_white),),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)),
  );
}