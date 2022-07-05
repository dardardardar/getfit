import 'package:flutter/material.dart';
import 'package:getfit/views/tipsandtrick.dart';
import 'package:getfit/widgets/colors.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: HomeView(),
  ));
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              infoCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(margin: EdgeInsets.all(12), child: fatCard()),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(margin: EdgeInsets.all(12), child: carbsCard()),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(margin: EdgeInsets.all(12), child: proteinCard())
                ],
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
      //         label: 'Tips & Tricks',
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

  Widget fatCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: LibColors.color_white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(0, 12), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
                image: AssetImage("assets/images/fat.png"), fit: BoxFit.cover),
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
      ),
    );
  }

  Widget carbsCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: LibColors.color_white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(0, 12), // changes position of shadow
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
      ),
    );
  }

  Widget proteinCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: LibColors.color_white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(0, 12), // changes position of shadow
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
      ),
    );
  }

  Widget infoCard() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
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

  Widget dateCard() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
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
              Expanded(
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
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
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
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Add Breakfast',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      '(6 am - 10 am) Recommend 100-500 calories',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
        ));
  }

  Widget brunchCard() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
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
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Add Brunch',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      '(6 am - 10 am) Recommend 100-500 calories',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
        ));
  }

  Widget lunchCard() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
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
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Add Lunch',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      '(12 pm - 15 pm) Recommend 100-500 calories',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
        ));
  }

  Widget snackCard() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
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
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Add Snack',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      '(15 pm - 17 pm) Recommend 100-500 calories',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
        ));
  }

  Widget dinnerCard() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
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
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Add Dinner',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      '(18 pm - 20 pm) Recommend 100-500 calories',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
        ));
  }

  Widget sleepCard() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
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
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Add Sleep',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      '(22 pm - 5 am)',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
        ));
  }

  Widget exerciseCard() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
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
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Add Exercise',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      'Make sure exercise is not to hard for you',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
        ));
  }
}
