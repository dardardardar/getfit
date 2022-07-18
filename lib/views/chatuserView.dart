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
        title:  Text('Chat'),
        backgroundColor: LibColors.primary_color,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 6,),
              chatCard("Dr. Thomas S","terima kasih atas sarannya"),
              SizedBox(height: 6,),
              chatCard("Didi Michael","baik kak terima kasih sarannya"),

            ],
          ),
        ),
      ),
    );
  }
}


Widget chatCard(String name, String txt,) {
  return Container(
    padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
    margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: [
             CircleAvatar(
               radius: 30.0,
               backgroundImage:  AssetImage("assets/images/personaltrainer.png"),
             )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                width: 170,
                child: Text(
                  name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              SizedBox(height: 4,),
              Container(
                width: 170,
                child: Text(
                  txt,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
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
                '19.52',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
