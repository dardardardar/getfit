import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';

class editprofileView extends StatefulWidget {
  const editprofileView({Key? key}) : super(key: key);

  @override
  State<editprofileView> createState() => _editprofileViewState();
}

class _editprofileViewState extends State<editprofileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Image(
                image: AssetImage("assets/images/back.png"),
              ),
              Column(
                children: [
                  Text('Edit Profile'),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: LibColors.primary_color,
      ),
      body: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16),
                width: 350,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Bambang Atkinson",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.create),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: 350,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "170 CM",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.create),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: 350,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "85 Kg",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.create),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: 350,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "01/01/1991",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.create),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: 350,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Male",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.create),
                  ),
                ),
              ),
              // editprofileCard(),
            ],
          ))),
    );
  }
}

Widget editprofileCard() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Container(
                    width: 170,
                    child: Text(
                      'Bambang Atkinson',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image(
                      image: AssetImage("assets/images/editicon.png"),
                      fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
        // color: LibColors.second_color,
      ));
}
