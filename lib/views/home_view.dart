import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/controller/consultant_controller.dart';
import 'package:getfit/controller/home_controller.dart';
import 'package:getfit/controller/notification_controller.dart';
import 'package:getfit/models/user_food_model.dart';
import 'package:getfit/models/user_info_model.dart';
import 'package:getfit/models/user_workout_model.dart';
import 'package:getfit/views/breakfastview.dart';
import 'package:getfit/controller/user_controller.dart';
import 'package:getfit/controller/user_controller.dart';
import 'package:getfit/views/exercise_view.dart';
import 'package:getfit/views/tipsandtrick.dart';
import 'package:getfit/widgets/colors.dart';
import 'package:getfit/widgets/snackbar_widgets.dart';
import '../models/user_model.dart';
import 'package:intl/intl.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}



class _HomeViewState extends State<HomeView> {
  var notification = NotificationController();
  @override
  void initState() {

    super.initState();

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<UserInfoModel>(
          future: HomeController().getUserInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data2 = snapshot.data!;
              return StreamBuilder<List<UserFoodModel>>(
                stream: HomeController().getFoods(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!;
                    var eaten = 0;
                    for (var item in data) {
                      eaten += item.calories;
                    }
                    var kcal = data2.targetCalories - eaten;
                    var color = kcal < 0 ? LibColors.danger_red : LibColors.second_color;
                    return StreamBuilder<List<UserWorkoutModel>>(
                      stream: HomeController().getExercises(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var burned = 0;
                          for (var item in snapshot.data!) {
                            burned += item.calories;
                          }
                          return Container(
                              margin: EdgeInsets.symmetric(horizontal: 12),
                              child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                                          margin: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            color: color,
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
                                                      eaten.toString() + ' / gr',
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
                                                      (data2.targetCalories - eaten).toString()  + ' / gr',
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
                                                      burned.toString() + ' / gr',
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(12),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: fatCard(data2.targetFat),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Expanded(
                                              child: carbsCard(data2.targetCarbs),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Expanded(
                                              child: proteinCard(data2.targetProtein),
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
                                  )));
                        }
                        return Container();
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
                },
              );
            }
            return Container();
          },
        ),

    );
  }

  Widget fatCard(int data) {
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
            '$data / gr',
            style: TextStyle(color: LibColors.primary_color),
          ),
        ],
      ),
    );
  }

  Widget carbsCard(int data) {
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
            '$data / gr',
            style: TextStyle(color: LibColors.primary_color),
          ),
        ],
      ),
    );
  }

  Widget proteinCard(int data) {
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
            '$data / gr',
            style: TextStyle(color: LibColors.primary_color),
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

                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      DateFormat.yMMMMEEEEd().format(DateTime.now()),
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [

                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget breakfastCard() {
    var image = AssetImage("assets/images/reminder.png");
    return GestureDetector(
      onTap: () {
        addfood(tag:'breakfast');
      },
      child: Container(
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
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        image = AssetImage("assets/images/notification-red.png");
                      });
                    },
                    child: Image(
                        image: image,
                        fit: BoxFit.cover),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget brunchCard() {
    return GestureDetector(
      onTap: (){
        addfood(tag: 'brunch');
      },
      child: Container(
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
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Image(
                        image: AssetImage("assets/images/reminder.png"),
                        fit: BoxFit.cover),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lunchCard() {
    return GestureDetector(
      onTap:(){
        addfood(tag: 'lunch');
      },
      child: Container(
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
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Image(
                        image: AssetImage("assets/images/reminder.png"),
                        fit: BoxFit.cover),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget snackCard() {
    return GestureDetector(
      onTap: (){addfood(tag: 'snack');},
      child: Container(
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
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Image(
                        image: AssetImage("assets/images/reminder.png"),
                        fit: BoxFit.cover),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget dinnerCard() {
    return GestureDetector(
      onTap: (){addfood(tag:'dinner');},
      child: Container(
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
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Image(
                        image: AssetImage("assets/images/reminder.png"),
                        fit: BoxFit.cover),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sleepCard() {
    return GestureDetector(
      onTap:  () async{

      },
      child: Container(
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
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Image(
                        image: AssetImage("assets/images/reminder.png"),
                        fit: BoxFit.cover),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget exerciseCard() {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ExerciseView()));
      },
      child: Container(
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
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {

                    },
                    child: Image(
                        image: AssetImage("assets/images/reminder.png"),
                        fit: BoxFit.cover),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void addfood({required String tag}){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => BreakfastView(tag: tag,)));
  }
}
