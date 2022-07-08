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
  int currentIndex = 0;
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
                  ],
                )));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // body: Container(
      //     margin: EdgeInsets.all(12),
      //     child: SingleChildScrollView(
      //         child: Column(
      //       children: <Widget>[
      //         profileCard(),
      //         editprofileCard(),
      //         personaldetailsCard(),
      //         nutritionCard(),
      //         allergiesCard(),
      //       ],
      //     )
      //     )
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (index) => setState(() => currentIndex = index),
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.history_edu),
      //         label: 'Home',
      //         backgroundColor: LibColors.primary_color),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.tips_and_updates),
      //         label: 'Tips & Trick',
      //         backgroundColor: LibColors.primary_color),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.chat),
      //         label: 'Consultation',
      //         backgroundColor: LibColors.primary_color),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: 'Profile',
      //         backgroundColor: LibColors.primary_color)
      //   ],
      // ),
    );
  }
}

Widget profileCard(UserModel _data) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(16),
        color: LibColors.second_color,
        child: Row(
          children: <Widget>[
            Container(
              child: Image(
                  image: AssetImage("assets/images/profile.png"),
                  fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    _data.displayName,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    (_data.goalCategories == 0)
                        ? "Diets"
                        : (_data.goalCategories == 1)
                            ? "Maintain Weight"
                            : "Lose Weight",
                    style: TextStyle(color: Colors.white),
                  ),
                  MaterialButton(
                    color: Colors.grey,
                    onPressed: () => FirebaseAuth.instance.signOut(),
                    child: Text('Sign Out'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  )
                ],
              ),
            ),
          ],
        ),
      ));
}

Widget editprofileCard(context) {
  return MaterialButton(
    onPressed: () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => editprofileView()));
    },
    child: Container(
      child: Text('Edit Profile'),
    ),
  );
  // return GestureDetector(
  //   onTap: () {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (BuildContext context) => editprofileView()));
  //   },
  //   child: ClipRRect(
  //     borderRadius: BorderRadius.circular(12),
  //     child: Container(
  //         padding: EdgeInsets.all(6),
  //         child: MaterialButton(
  //           color: Color.fromARGB(255, 231, 231, 231),
  //           minWidth: 400,
  //           onPressed: () {},
  //           child: Text(
  //             'Edit Profile',
  //             textAlign: TextAlign.left,
  //           ),
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //         )
  //         // color: LibColors.second_color,

  //         ),
  //   ),
  // );
}

Widget mygoalCard(context) {
  return MaterialButton(
    onPressed: () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => MygoalView()));
    },
    child: Container(
      child: Text('My Goal'),
    ),
  );
  // return ClipRRect(
  //     borderRadius: BorderRadius.circular(12),
  //     child: Container(
  //         padding: EdgeInsets.all(6),
  //         child: MaterialButton(
  //           color: Color.fromARGB(255, 231, 231, 231),
  //           minWidth: 400,
  //           onPressed: () {},
  //           child: Text(
  //             'My Goal',
  //             textAlign: TextAlign.left,
  //           ),
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //         )
  //         // color: LibColors.second_color,

  //         ));
}
