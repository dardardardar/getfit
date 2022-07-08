import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/views/chatuserView.dart';
import 'package:getfit/widgets/colors.dart';

class ConsultationView extends StatefulWidget {
  const ConsultationView({Key? key}) : super(key: key);

  @override
  State<ConsultationView> createState() => _ConsultationViewState();
}

class _ConsultationViewState extends State<ConsultationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        backgroundColor: LibColors.primary_color,

        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ChatuserView()));
        },
      ),

      body: Container(
        margin: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(12),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Search Your Personal Consultant",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: LibColors.primary_color, width: 1.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintStyle: TextStyle(color: LibColors.primary_color)),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(12),
                child: Text('Recommended Personal Trainer or Doctor'),
              ),
              profileCard(),
              profileCard(),
              profileCard(),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(12),
                child: Text('Specialist Personal trainer or Doctor'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(12), child: personaltrainerCard()),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                      margin: EdgeInsets.all(12), child: personaltrainerCard()),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileCard() {
  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: LibColors.color_white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 5), // changes position of shadow
        ),
      ],
    ),
    // color: Color.fromARGB(255, 231, 231, 231),
    child: Row(
      children: <Widget>[
        Container(
          width: 130,
          height: 140,
          child: Image(
              image: AssetImage("assets/images/personaltrainer.png"),
              fit: BoxFit.fill),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Dr. Howard Ghifari',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                alignment: Alignment.topLeft,
                child: Text(
                  'Personal Trainer Fitnes',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 11,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: LibColors.second_color,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        'Rating 4.5/5',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 11, color: LibColors.color_white),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: LibColors.second_color,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        '10 Tahun',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 11, color: LibColors.color_white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(4, 8, 0, 4),
                alignment: Alignment.topLeft,
                child: Text(
                  'FREE',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: MaterialButton(
                    color: LibColors.primary_color,
                    onPressed: () {},
                    child: Text(
                      'Request',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}

Widget personaltrainerCard() {
  return Container(
    width: 144,
    height: 144,
    alignment: Alignment.center,
    // margin: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Color.fromARGB(255, 255, 255, 255),
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: AssetImage("assets/images/pticon.png"), fit: BoxFit.cover),
        SizedBox(
          height: 18,
        ),
        Text(
          'Personal Trainer'.toUpperCase(),
          style: TextStyle(
            color: LibColors.primary_color,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
