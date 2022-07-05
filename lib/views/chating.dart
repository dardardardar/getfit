import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  // int currentIndex = 0;
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
              Image(
                image: AssetImage("assets/images/avachat.png"),
              ),
              Column(
                children: [
                  Text('Bambang Atkinson'),
                  Text('Personal Trainer'),
                ],
              ),
            ],
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //     child: Icon(Icons.menu),
        //   ),
        // ],
        backgroundColor: Color.fromARGB(255, 194, 194, 194),
      ),
    );
  }
}
