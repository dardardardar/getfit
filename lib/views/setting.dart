import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.menu),
          ),
        ],
        backgroundColor: LibColors.primary_color,
      ),
      body: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              editprofileCard(),
              personaldetailsCard(),
              nutritionCard(),
              allergiesCard(),
            ],
          ))),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.history_edu),
              label: 'Home',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(Icons.tips_and_updates),
              label: 'Tips & Trick',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Consultation',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: LibColors.primary_color)
        ],
      ),
    );
  }
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

Widget personaldetailsCard() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
          padding: EdgeInsets.all(6),
          child: MaterialButton(
            color: Color.fromARGB(255, 231, 231, 231),
            minWidth: 400,
            onPressed: () {},
            child: Text(
              'Personal Details',
              textAlign: TextAlign.left,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          )
          // color: LibColors.second_color,

          ));
}

Widget nutritionCard() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
          padding: EdgeInsets.all(6),
          child: MaterialButton(
            color: Color.fromARGB(255, 231, 231, 231),
            minWidth: 400,
            onPressed: () {},
            child: Text(
              'Nutrition Setting',
              textAlign: TextAlign.left,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          )
          // color: LibColors.second_color,

          ));
}

Widget allergiesCard() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
          padding: EdgeInsets.all(6),
          child: MaterialButton(
            color: Color.fromARGB(255, 231, 231, 231),
            minWidth: 400,
            onPressed: () {},
            child: Text(
              'Allergies',
              textAlign: TextAlign.left,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          )
          // color: LibColors.second_color,

          ));
}
