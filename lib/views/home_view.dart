import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/controller/user_controller.dart';
import 'package:getfit/views/tipsandtrick.dart';
import 'package:getfit/widgets/colors.dart';

import '../models/user_model.dart';



class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              infoCard(),
              Container(
                margin: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: fatCard(),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: carbsCard(),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: proteinCard(),
                    )
                  ],
                ),
              ),
              dateCard(),
              breakfastCard(),
              brunchCard(),
              lunchCard(),
              snackCard(),
              dinnerCard(),
              sleepCard(),
              exerciseCard(),
            ],
          ))),

    );
  }

  Widget fatCard() {
    return Container(
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
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/images/fat.png"), fit: BoxFit.cover),
          Text(
            'Fat'.toUpperCase(),
            style: TextStyle(
              color: LibColors.primary_color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '500 / gr',
            style: TextStyle(color: LibColors.primary_color),
          ),
        ],
      ),
    );
  }

  Widget carbsCard() {
    return Container(
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
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
              image: AssetImage("assets/images/carbohidrat.png"),
              fit: BoxFit.cover),
          Text(
            'Carbs'.toUpperCase(),
            style: TextStyle(
              color: LibColors.primary_color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '500 / gr',
            style: TextStyle(color: LibColors.primary_color),
          ),
        ],
      ),
    );
  }

  Widget proteinCard() {
    return Container(
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
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
              image: AssetImage("assets/images/protein.png"),
              fit: BoxFit.cover),
          Text(
            'Protein'.toUpperCase(),
            style: TextStyle(
              color: LibColors.primary_color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '500 / gr',
            style: TextStyle(color: LibColors.primary_color),
          ),
        ],
      ),
    );
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

  Widget dateCard() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Today, 10 March 2022',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget breakfastCard() {
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/breakfast.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 170,
                  child: Text(
                    'Add Breakfast',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Text(
                  '(6 am - 10 am) Recommend 100-500 calories',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/reminder.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget brunchCard() {
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/brunch.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 170,
                  child: Text(
                    'Add Brunch',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                Text(
                  '(6 am - 10 am) Recommend 100-500 calories',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/reminder.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget lunchCard() {
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/lunch.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 170,
                  child: Text(
                    'Add Lunch',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                Text(
                  '(12 pm - 15 pm) Recommend 100-500 calories',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/reminder.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget snackCard() {
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/snack.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 170,
                  child: Text(
                    'Add Snack',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                Text(
                  '(15 pm - 17 pm) Recommend 100-500 calories',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/reminder.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dinnerCard() {
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/dinner.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 170,
                  child: Text(
                    'Add Dinner',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                Text(
                  '(18 pm - 20 pm) Recommend 100-500 calories',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/reminder.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sleepCard() {
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/sleep.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 170,
                  child: Text(
                    'Add Sleep',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                Text(
                  '(22 pm - 5 am) Recommend to take a sleep',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/reminder.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget exerciseCard() {
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/training.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 170,
                  child: Text(
                    'Add Exercise',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                Text(
                  'Make sure exercise is not to hard for you ok',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image(
                    image: AssetImage("assets/images/reminder.png"),
                    fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
