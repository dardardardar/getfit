import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getfit/views/bottomnavbar.dart';
import 'package:getfit/views/breakfastview.dart';
import 'package:getfit/views/chating.dart';
import 'package:getfit/views/consultation.dart';
import 'package:getfit/views/home_view.dart';
import 'package:getfit/views/loading_view.dart';
import 'package:getfit/views/profile.dart';
import 'package:getfit/views/register_view.dart';
import 'package:getfit/views/setting.dart';
import 'package:getfit/views/tipsandtrick.dart';
import 'package:getfit/views/welcome_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: SplashScreenView(),
    );
  }
}

class Mainpage extends StatelessWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error!"),
            );
          }
          if (snapshot.hasData) {
            return BottomnavbarView();
          } else {
            return WelcomeView();
          }
        },
      ),
    );
  }
}
