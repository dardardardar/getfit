import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/views/bottomnavbar.dart';
import 'package:getfit/widgets/colors.dart';

class dietView extends StatefulWidget {
  const dietView({Key? key}) : super(key: key);

  @override
  State<dietView> createState() => _dietViewState();
}

class _dietViewState extends State<dietView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => BottomnavbarView()),
                      (route) => route.isFirst);
                },
                child: Icon(Icons.arrow_back_ios_new_rounded),
              ),
              // Image(
              //   image: AssetImage("assets/images/back.png"),
              // ),
              Column(
                children: [
                  Text('Diet'),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: LibColors.primary_color,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              iklanCard(),
              Container(
                width: 320,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at fermentum tellus. Mauris feugiat fermentum posuere. Aenean posuere ac tortor id volutpat. Curabitur tincidunt ipsum sapien, nec sodales lorem sodales eu. Donec non tortor non lectus ultrices condimentum. Etiam rhoncus nisi nec sodales accumsan. Maecenas id gravida ante. Etiam vulputate metus id mauris egestas ullamcorper. Cras aliquet urna ac hendrerit bibendum. Morbi eros quam, commodo in pretium ut, feugiat condimentum mauris. Donec at tincidunt orci.',
                ),
              ),
              iklan2Card(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget iklanCard() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: EdgeInsets.all(22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
              image: AssetImage("assets/images/dietgirl.png"),
              fit: BoxFit.cover),
        ],
      ),
    ),
  );
}

Widget iklan2Card() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: EdgeInsets.all(22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
              image: AssetImage("assets/images/buahsayur.png"),
              fit: BoxFit.cover),
        ],
      ),
    ),
  );
}
