import 'dart:ui';
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
      appBar: AppBar(
        title: Text('Hello Atkinson'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.menu),
          ),
        ],
        backgroundColor: LibColors.primary_color,
      ),
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
                  Text('Recommend Nutritionist Doctor'),
                  Container(
                    margin: EdgeInsets.only(left: 60),
                    child: MaterialButton(
                      color: Color.fromARGB(255, 231, 231, 231),
                      minWidth: 50,
                      onPressed: () {},
                      child: Text(
                        'More',
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  )
                ],
              ),
              profileCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.history_edu),
              label: 'Home',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(Icons.tips_and_updates),
              label: 'Tips & Trick',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Consultation',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: LibColors.primary_color)
        ],
      ),
    );
  }
}

Widget profileCard() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(16),
        color: Color.fromARGB(255, 231, 231, 231),
        child: Row(
          children: <Widget>[
            Container(
              child: Image(
                  image: AssetImage("assets/images/personaltrainer.png"),
                  fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Dr. Howard Ghifari',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    'Personal Trainer Fitnes',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  MaterialButton(
                    color: Colors.grey,
                    onPressed: () {},
                    child: Text('Chat'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  )
                ],
              ),
            ),
          ],
        ),
      ));
}
