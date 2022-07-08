import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/views/dietpage.dart';
import 'package:getfit/widgets/colors.dart';

class TipsandtrickView extends StatefulWidget {
  const TipsandtrickView({Key? key}) : super(key: key);

  @override
  State<TipsandtrickView> createState() => _TipsandtrickViewState();
}

class _TipsandtrickViewState extends State<TipsandtrickView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      hintText: "Search ",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: LibColors.primary_color, width: 1.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintStyle: TextStyle(color: LibColors.primary_color)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: dietCard()),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(child: workoutCard()),
                  const SizedBox(
                    width: 4,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: foodCard()),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(child: sleepCard()),
                  const SizedBox(
                    width: 4,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),

    );
  }

  Widget dietCard() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => dietView()));
      },
      child: Container(
        margin: EdgeInsets.all(12),
        width: double.infinity,
          height: 150,

          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              
              color: Color(0xff48BDFF),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image(
                      image: AssetImage("assets/images/diet.png"),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover),

                ),
                SizedBox(height: 8,),
                Text(
                  'Diet'.toUpperCase(),
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

      ),
    );
  }

  Widget vegetablesCard() {
    return Container(
      margin: EdgeInsets.all(12),
      width: double.infinity,
      height: 150,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xff56E100),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage("assets/images/vegetables.png"),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover),
              SizedBox(height: 8,),
              Text(
                'Vegetables'.toUpperCase(),
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
      ),
    );
  }

  Widget foodCard() {
    return Container(
      margin: EdgeInsets.all(12),
      width: double.infinity,
      height: 150,


        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffFFC30B),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage("assets/images/food.png"),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover),
              SizedBox(height: 8,),
              Text(
                'Food'.toUpperCase(),
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

    );
  }

  Widget workoutCard() {
    return Container(
      margin: EdgeInsets.all(12),
      width: double.infinity,
      height: 150,


        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffD70000),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage("assets/images/workout.png"),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover),
              SizedBox(height: 8,),
              Text(
                'Workout'.toUpperCase(),
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

    );
  }

  Widget sleepCard() {
    return Container(
      margin: EdgeInsets.all(12),
      width: double.infinity,
      height: 150,

        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xff00516A),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage("assets/images/sleeping.png"),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover),
              SizedBox(height: 8,),
              Text(
                'Sleep'.toUpperCase(),
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

    );
  }

  Widget mentalhealthCard() {
    return Container(
      margin: EdgeInsets.all(12),
      width: double.infinity,
      height: 150,

        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffBA26FF),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage("assets/images/mentalhealth.png"),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover),
              SizedBox(height: 8,),
              Text(
                'Mental Health'.toUpperCase(),
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),

    );
  }

  Widget iklanCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
                image: AssetImage("assets/images/buahsayur.png"),
                fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
