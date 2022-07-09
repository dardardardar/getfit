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
        title: Text('Breakfast'),
        backgroundColor: LibColors.primary_color,
      ),
      body: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(12),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Search ",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: LibColors.primary_color, width: 1.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintStyle: TextStyle(color: LibColors.primary_color)),
                ),
              ),
              infoCard(),
              Row(

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
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    margin: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: LibColors.second_color,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 5), // changes position of shadow
        ),
      ],
    ),
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
  );
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
