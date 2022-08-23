import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/views/bottomnavbar.dart';
import 'package:getfit/widgets/colors.dart';

class dietView extends StatefulWidget {
  final String title;
  final String content;
  final String imageUrl;
  final int category;
  const dietView(
      {Key? key,
      required this.title,
        required this.content,
        required this.imageUrl,
        required this.category,
      }) : super(key: key);

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
              iklanCard(widget.imageUrl),
              iklan2Card(widget.title),
              Container(
                width: 320,
                child: Text(
                    widget.content
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: 320,
                child: Text(
                  widget.content
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: 320,
                child: Text(
                  widget.content
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget iklanCard(String url) {
  return Container(
    alignment: Alignment.topCenter,
    child: Container(
      padding: EdgeInsets.all(22),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
              image: NetworkImage(url),
              fit: BoxFit.cover),
        ],
      ),
    ),
  );
}


Widget iklan2Card(String title) {
  return Container(
    width: 320,
    margin: EdgeInsets.all(12),
    child: Text(title,textAlign: TextAlign.start, style: TextStyle(
      fontWeight: FontWeight.bold,fontSize: 20
    ),),
  );
}
