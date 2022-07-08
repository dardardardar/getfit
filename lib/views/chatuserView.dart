import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';

import 'bottomnavbar.dart';

class ChatuserView extends StatefulWidget {
  const ChatuserView({Key? key}) : super(key: key);

  @override
  State<ChatuserView> createState() => _ChatuserViewState();
}

class _ChatuserViewState extends State<ChatuserView> {
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
                  Text('Chat'),
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
              chatCard(),
              chatCard(),
              chatCard(),
              chatCard(),
              chatCard(),
              chatCard(),
              chatCard(),
              chatCard(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget chatCard() {
  return Container(
    padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
    margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(12),
    //   color: LibColors.color_white,
    //   boxShadow: [
    //     BoxShadow(
    //       color: Colors.grey.withOpacity(0.5),
    //       spreadRadius: 2,
    //       blurRadius: 5,
    //       offset: Offset(0, 5), // changes position of shadow
    //     ),
    //   ],
    // ),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: [
              Image(
                  image: AssetImage("assets/images/Ellipse.png"),
                  fit: BoxFit.cover),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                width: 170,
                child: Text(
                  'Bambang Edward',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Container(
                width: 170,
                child: Text(
                  'Terima kasih saran nya',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 8,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                '8.30 PM',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ],
    ),
  );
}