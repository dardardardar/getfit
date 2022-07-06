import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';

class ConsultationView extends StatefulWidget {
  const ConsultationView({Key? key}) : super(key: key);

  @override
  State<ConsultationView> createState() => _ConsultationViewState();
}

class _ConsultationViewState extends State<ConsultationView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        margin: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: 350,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Search Your Personal Trainer",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Recommended Consultant'),
                  Container(
                    margin: EdgeInsets.only(left: 60),
                    child: MaterialButton(
                      color: LibColors.primary_color,
                      minWidth: 50,
                      onPressed: () {},
                      child: Text(
                        'More',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  )
                ],
              ),
              profileCard(),
              profileCard(),
              profileCard(),
              profileCard(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Specialist Personal trainer or Doctor'),
                ],
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
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (index) => setState(() => currentIndex = index),
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.history_edu),
      //         label: 'Home',
      //         backgroundColor: LibColors.primary_color),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.tips_and_updates),
      //         label: 'Tips & Trick',
      //         backgroundColor: LibColors.primary_color),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.chat),
      //         label: 'Consultation',
      //         backgroundColor: LibColors.primary_color),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: 'Profile',
      //         backgroundColor: LibColors.primary_color)
      //   ],
      // ),
    );
  }
}

Widget profileCard() {
  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.all(12),
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
          child: Image(
              image: AssetImage("assets/images/personaltrainer.png"),
              fit: BoxFit.cover),
        ),
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 12),
                width: 150,
                child: Text(
                  'Dr. Howard Ghifari',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12),
                width: 150,
                child: Text(
                  'Personal Trainer Fitnes',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 10,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(4),
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
                      child: Text(
                        'rating 4.5/5',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(4),
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
                      child: Text(
                        '10 Tahun',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 10),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12),
                width: 150,
                child: Text(
                  'Rp 50.000',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: MaterialButton(
                    color: LibColors.primary_color,
                    onPressed: () {},
                    child: Text(
                      'Chat',
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
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
        Text(
          'Personal Trainer'.toUpperCase(),
          style: TextStyle(
            color: LibColors.primary_color,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
}
