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
              ListView(
                  physics : NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                  iklan4Card(),
                  iklan4Card(),
                  iklan4Card(),
                ],
              )
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
              SizedBox(
                height: 8,
              ),
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
            SizedBox(
              height: 8,
            ),
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
            SizedBox(
              height: 8,
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
            SizedBox(
              height: 8,
            ),
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
            SizedBox(
              height: 8,
            ),
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
            SizedBox(
              height: 8,
            ),
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

  // Widget iklanCard() {
  //   return Container(
  //     child: Card(
  //       clipBehavior: Clip.antiAlias,
  //       child: Column(
  //         children: [
  //           Image.asset('assets/images/buahsayur.png'),
  //           ListTile(
  //             title: const Text('Cara diet dengan buah dan sayur'),
  //             subtitle: Text(
  //               'cocok untuk kamu yang diet',
  //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(16.0),
  //             child: Text(
  //               'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit enim, scelerisque non lectus a, dapibus luctus dolor. Sed tempor ex semper odio posuere pulvinar. Fusce vehicula nibh a nisl posuere mollis. Cras eu justo at leo aliquam aliquet. Ut malesuada quis erat eget tempus. Vestibulum volutpat, nisl vitae faucibus sagittis, est tellus pellentesque odio, ut suscipit lectus lorem a lorem. Aenean lobortis vulputate tortor, ac ultricies odio condimentum vitae. Nulla viverra urna blandit, consectetur magna sed, dapibus arcu. Maecenas aliquam erat at vehicula viverra.',
  //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
  //             ),
  //           ),
  // }

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
          ],
        ),
      ),
    );
  }

  Widget iklan4Card() {
    return Container(
      decoration: BoxDecoration(
        color: LibColors.color_white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
         Container(
           width: double.infinity,
           child: ClipRRect(
             borderRadius: BorderRadius.vertical(top:Radius.circular(8)),
             child:  Image.network("https://firebasestorage.googleapis.com/v0/b/getfit-89b61.appspot.com/o/Article%2Fimage%205%20(1).png?alt=media&token=edf09915-285c-464a-aaf6-7eab323ae292", fit: BoxFit.fitWidth,),
           ),
         ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(12),
            child: Text('Mengatur waktu tidur yang baik'.toUpperCase() , style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16
            ),),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit enim, scelerisque non lectus a, dapibus luctus dolor. Sed tempor ex semper odio posuere pulvinar. Fusce vehicula nibh a nisl posuere mollis. Cras eu justo at leo aliquam aliquet. Ut malesuada quis erat eget tempus. Vestibulum volutpat, nisl vitae faucibus sagittis, est tellus pellentesque odio, ut suscipit lectus lorem a lorem. Aenean lobortis vulputate tortor, ac ultricies odio condimentum vitae. Nulla viverra urna blandit, consectetur magna sed, dapibus arcu. Maecenas aliquam erat at vehicula viverra.'.substring(0,100) + "...", style: TextStyle(
                fontSize: 14
            ),),
          )
        ],
      ),
      // child: Card(
      //   clipBehavior: Clip.antiAlias,
      //   color: LibColors.primary_color,
      //   child: Column(
      //     children: [
      //       Image.network("https://firebasestorage.googleapis.com/v0/b/getfit-89b61.appspot.com/o/image%206.png?alt=media&token=72c96a26-7c64-4262-9813-ed249e05eed5"),
      //       ListTile(
      //         title: const Text('Apakah olahraga online efektif?'),
      //         subtitle: Text(
      //           'Cocok untuk kamu yang suka olahraga online',
      //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Text(
      //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit enim, scelerisque non lectus a, dapibus luctus dolor. Sed tempor ex semper odio posuere pulvinar. Fusce vehicula nibh a nisl posuere mollis. Cras eu justo at leo aliquam aliquet. Ut malesuada quis erat eget tempus. Vestibulum volutpat, nisl vitae faucibus sagittis, est tellus pellentesque odio, ut suscipit lectus lorem a lorem. Aenean lobortis vulputate tortor, ac ultricies odio condimentum vitae. Nulla viverra urna blandit, consectetur magna sed, dapibus arcu. Maecenas aliquam erat at vehicula viverra.',
      //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
      //         ),
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }
}