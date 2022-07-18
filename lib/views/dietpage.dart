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
        title: Text(""),
        backgroundColor: LibColors.primary_color,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              iklanCard(),
              iklan2Card(),
              Container(
                width: 320,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at fermentum tellus. Mauris feugiat fermentum posuere. Aenean posuere ac tortor id volutpat. Curabitur tincidunt ipsum sapien, nec sodales lorem sodales eu. Donec non tortor non lectus ultrices condimentum. Etiam rhoncus nisi nec sodales accumsan. Maecenas id gravida ante. Etiam vulputate metus id mauris egestas ullamcorper. Cras aliquet urna ac hendrerit bibendum. Morbi eros quam, commodo in pretium ut, feugiat condimentum mauris. Donec at tincidunt orci.',
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: 320,
                child: Text(
                  '     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at fermentum tellus. Mauris feugiat fermentum posuere. Aenean posuere ac tortor id volutpat. Curabitur tincidunt ipsum sapien, nec sodales lorem sodales eu. Donec non tortor non lectus ultrices condimentum. Etiam rhoncus nisi nec sodales accumsan. Maecenas id gravida ante. Etiam vulputate metus id mauris egestas ullamcorper. Cras aliquet urna ac hendrerit bibendum. Morbi eros quam, commodo in pretium ut, feugiat condimentum mauris. Donec at tincidunt orci.',
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: 320,
                child: Text(
                  '     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at fermentum tellus. Mauris feugiat fermentum posuere. Aenean posuere ac tortor id volutpat. Curabitur tincidunt ipsum sapien, nec sodales lorem sodales eu. Donec non tortor non lectus ultrices condimentum. Etiam rhoncus nisi nec sodales accumsan. Maecenas id gravida ante. Etiam vulputate metus id mauris egestas ullamcorper. Cras aliquet urna ac hendrerit bibendum. Morbi eros quam, commodo in pretium ut, feugiat condimentum mauris. Donec at tincidunt orci.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget iklanCard() {
  return Container(
    alignment: Alignment.topCenter,
    child: Container(
      padding: EdgeInsets.all(22),
      child: Column(
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
  return Container(
    width: 320,
    margin: EdgeInsets.all(12),
    child: Text(
      "Beberapa makanan sehat yang bisa dicoba untuk membantu diet kamu",
      textAlign: TextAlign.start,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}
