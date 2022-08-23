import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getfit/views/bottomnavbar.dart';
import 'package:getfit/views/breakfastview.dart';
import 'package:getfit/views/chatconsultantView.dart';
import 'package:getfit/views/chating.dart';
import 'package:getfit/views/consultation.dart';
import 'package:getfit/views/dietpage.dart';
import 'package:getfit/views/editprofileView.dart';
import 'package:getfit/views/home_view.dart';
import 'package:getfit/views/loading_view.dart';
import 'package:getfit/views/mygoalView.dart';
import 'package:getfit/views/profile.dart';
import 'package:getfit/views/register_view.dart';
import 'package:getfit/views/request.dart';
import 'package:getfit/views/tipsandtrick.dart';
import 'package:getfit/views/login_view.dart';
import 'package:getfit/widgets/snackbar_widgets.dart';


Future<void> _firebaseMessagingBackgroundHandler(message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen(
          (RemoteMessage message) {
        debugPrint("onMessage:");
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: SnackBarWidgets.snackKey,
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
