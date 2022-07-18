import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/views/request.dart';
import 'package:getfit/widgets/colors.dart';

class ChatconsultantView extends StatefulWidget {
  const ChatconsultantView({Key? key}) : super(key: key);

  @override
  State<ChatconsultantView> createState() => _ChatconsultantViewState();
}

class _ChatconsultantViewState extends State<ChatconsultantView> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.circle_notifications_outlined),
        backgroundColor: LibColors.primary_color,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => requestView()));
        },
      ),

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 6,),
              chatCard("Arjuna","terima kasih atas sarannya"),
              SizedBox(height: 6,),
              chatCard("Watson","baik kak terima kasih sarannya"),
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
                backgroundColor: LibColors.color_grey,
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
