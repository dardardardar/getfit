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
                width: 300,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Search Tips & Tricks here",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: dietCard()),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(child: workoutCard()),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: foodCard()),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(child: sleepCard()),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              iklanCard(),
              iklan3Card(),
              iklan4Card(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: <Widget>[
              //     Expanded(child: sleepCard()),
              //     const SizedBox(
              //       width: 5,
              //     ),
              //     Expanded(child: mentalhealthCard()),
              //     const SizedBox(
              //       width: 5,
              //     ),
              //   ],
              // ),
              // iklanCard(),
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

  Widget dietCard() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => dietView()));
      },
      child: Container(
        margin: EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff48BDFF),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: Offset(0, 12), // changes position of shadow
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
        ),
      ),
    );
  }

  Widget vegetablesCard() {
    return Container(
      margin: EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff56E100),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(0, 12), // changes position of shadow
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
                  fit: BoxFit.cover),
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
      ),
    );
  }

  Widget foodCard() {
    return Container(
      margin: EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffFFC30B),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(0, 12), // changes position of shadow
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
                  fit: BoxFit.cover),
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
      ),
    );
  }

  Widget workoutCard() {
    return Container(
      margin: EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffD70000),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(0, 12), // changes position of shadow
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
                  fit: BoxFit.cover),
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
      ),
    );
  }

  Widget sleepCard() {
    return Container(
      margin: EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff00516A),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(0, 12), // changes position of shadow
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
                  fit: BoxFit.cover),
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
      ),
    );
  }

  Widget mentalhealthCard() {
    return Container(
      margin: EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffBA26FF),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(0, 12), // changes position of shadow
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
                  fit: BoxFit.cover),
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
      ),
    );
  }

  Widget iklanCard() {
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.asset('assets/images/buahsayur.png'),
            ListTile(
              title: const Text('Cara diet dengan buah dan sayur'),
              subtitle: Text(
                'cocok untuk kamu yang diet',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit enim, scelerisque non lectus a, dapibus luctus dolor. Sed tempor ex semper odio posuere pulvinar. Fusce vehicula nibh a nisl posuere mollis. Cras eu justo at leo aliquam aliquet. Ut malesuada quis erat eget tempus. Vestibulum volutpat, nisl vitae faucibus sagittis, est tellus pellentesque odio, ut suscipit lectus lorem a lorem. Aenean lobortis vulputate tortor, ac ultricies odio condimentum vitae. Nulla viverra urna blandit, consectetur magna sed, dapibus arcu. Maecenas aliquam erat at vehicula viverra.',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            // ButtonBar(
            //   alignment: MainAxisAlignment.start,
            //   children: [
            //     FlatButton(
            //       textColor: const Color(0xFF6200EE),
            //       onPressed: () {
            //         // Perform some action
            //       },
            //       child: const Text('ACTION 1'),
            //     ),
            //     FlatButton(
            //       textColor: const Color(0xFF6200EE),
            //       onPressed: () {
            //         // Perform some action
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(12),
    //   child: Container(
    //     padding: EdgeInsets.all(22),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Image(
    //             image: AssetImage("assets/images/buahsayur.png"),
    //             fit: BoxFit.cover),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget iklan3Card() {
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.asset('assets/images/turu.png'),
            ListTile(
              title: const Text('Mengatur waktu tidur yang baik'),
              subtitle: Text(
                'Baik untuk kamu yang jam tidur tidak teratur ',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit enim, scelerisque non lectus a, dapibus luctus dolor. Sed tempor ex semper odio posuere pulvinar. Fusce vehicula nibh a nisl posuere mollis. Cras eu justo at leo aliquam aliquet. Ut malesuada quis erat eget tempus. Vestibulum volutpat, nisl vitae faucibus sagittis, est tellus pellentesque odio, ut suscipit lectus lorem a lorem. Aenean lobortis vulputate tortor, ac ultricies odio condimentum vitae. Nulla viverra urna blandit, consectetur magna sed, dapibus arcu. Maecenas aliquam erat at vehicula viverra.',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            // ButtonBar(
            //   alignment: MainAxisAlignment.start,
            //   children: [
            //     FlatButton(
            //       textColor: const Color(0xFF6200EE),
            //       onPressed: () {
            //         // Perform some action
            //       },
            //       child: const Text('ACTION 1'),
            //     ),
            //     FlatButton(
            //       textColor: const Color(0xFF6200EE),
            //       onPressed: () {
            //         // Perform some action
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(12),
    //   child: Container(
    //     padding: EdgeInsets.all(22),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Image(
    //             image: AssetImage("assets/images/buahsayur.png"),
    //             fit: BoxFit.cover),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget iklan4Card() {
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.asset('assets/images/olahragaonline.png'),
            ListTile(
              title: const Text('Apakah olahraga online efektif?'),
              subtitle: Text(
                'Cocok untuk kamu yang suka olahraga online',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit enim, scelerisque non lectus a, dapibus luctus dolor. Sed tempor ex semper odio posuere pulvinar. Fusce vehicula nibh a nisl posuere mollis. Cras eu justo at leo aliquam aliquet. Ut malesuada quis erat eget tempus. Vestibulum volutpat, nisl vitae faucibus sagittis, est tellus pellentesque odio, ut suscipit lectus lorem a lorem. Aenean lobortis vulputate tortor, ac ultricies odio condimentum vitae. Nulla viverra urna blandit, consectetur magna sed, dapibus arcu. Maecenas aliquam erat at vehicula viverra.',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            // ButtonBar(
            //   alignment: MainAxisAlignment.start,
            //   children: [
            //     FlatButton(
            //       textColor: const Color(0xFF6200EE),
            //       onPressed: () {
            //         // Perform some action
            //       },
            //       child: const Text('ACTION 1'),
            //     ),
            //     FlatButton(
            //       textColor: const Color(0xFF6200EE),
            //       onPressed: () {
            //         // Perform some action
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(12),
    //   child: Container(
    //     padding: EdgeInsets.all(22),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Image(
    //             image: AssetImage("assets/images/buahsayur.png"),
    //             fit: BoxFit.cover),
    //       ],
    //     ),
    //   ),
    // );
  }
}
