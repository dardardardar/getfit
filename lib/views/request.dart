import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';

class requestView extends StatefulWidget {
  const requestView({Key? key}) : super(key: key);

  @override
  State<requestView> createState() => _requestViewState();
}


class _requestViewState extends State<requestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 8),
          child: Text("Request")
        ),
        backgroundColor: LibColors.primary_color,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 8,),
              reqCard(),

            ],
          ),
        ),
      ),
    );
  }
}

Widget reqCard() {
  return Container(
    padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
    margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
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
                width: 150,
                child: Text(
                  'Bambang Edward',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 70,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: LibColors.primary_color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                'Accept',
                style: TextStyle(fontSize: 12, color: Colors.white),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
