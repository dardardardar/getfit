import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getfit/views/bottomnavbar.dart';
import 'package:getfit/views/home_view.dart';
import 'package:getfit/widgets/colors.dart';

class BreakfastView extends StatefulWidget {
  const BreakfastView({Key? key}) : super(key: key);

  @override
  State<BreakfastView> createState() => _BreakfastViewState();
}

class _BreakfastViewState extends State<BreakfastView> {
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
              Column(
                children: [
                  Text('Breakfast'),
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
        backgroundColor: LibColors.primary_color,
      ),
      body: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                width: 300,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Search Your Food Here",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              infoCard(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Recently Food'),
                ],
              ),
              foodCard(),
              foodCard(),
            ]),
          )),
    );
  }
}

Widget infoCard() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: EdgeInsets.only(top: 16, bottom: 16),
        padding: EdgeInsets.all(16),
        color: LibColors.second_color,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Text(
                    'EATEN',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '500 / gr',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'KCAL LEFT',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '1500 / gr',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'BURNED',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '300 / gr',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
}

Widget foodCard() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Nasi Goreng',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '500Kcal',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image(
                      image: AssetImage("assets/images/addicon.png"),
                      fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
      ));
}
