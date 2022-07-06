import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int currentIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email.toString()),
        backgroundColor: LibColors.primary_color,
      ),
      body: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              profileCard(),
              editprofileCard(),
              mygoalCard(),
            ],
          ))),
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

Widget profileCard() {
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
                    'Bambang Atkinson',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Maintain Weight',
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

Widget editprofileCard() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
          padding: EdgeInsets.all(6),
          child: MaterialButton(
            color: Color.fromARGB(255, 231, 231, 231),
            minWidth: 400,
            onPressed: () {},
            child: Text(
              'Edit Profile',
              textAlign: TextAlign.left,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          )
          // color: LibColors.second_color,

          ));
}

Widget mygoalCard() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
          padding: EdgeInsets.all(6),
          child: MaterialButton(
            color: Color.fromARGB(255, 231, 231, 231),
            minWidth: 400,
            onPressed: () {},
            child: Text(
              'My Goal',
              textAlign: TextAlign.left,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          )
          // color: LibColors.second_color,

          ));
}
