import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getfit/views/chatconsultantView.dart';
import 'package:getfit/views/consultation.dart';
import 'package:getfit/views/home_view.dart';
import 'package:getfit/views/profile.dart';
import 'package:getfit/views/tipsandtrick.dart';
import 'package:getfit/widgets/colors.dart';

import '../controller/user_controller.dart';
import '../models/user_model.dart';

class BottomnavbarView extends StatefulWidget {
  const BottomnavbarView({Key? key}) : super(key: key);

  @override
  State<BottomnavbarView> createState() => _BottomnavbarViewState();
}

class _BottomnavbarViewState extends State<BottomnavbarView> {
  int currentIndex = 0;
  PageController pageController = PageController();
  List<Widget> pages = [
    HomeView(),
    TipsandtrickView(),
    ConsultationView(),
    ProfileView(),
  ];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      print(index);
      currentIndex = index;
    });
  }

  final userdata = UserController().readUserDatabyId();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<UserModel?>(
          future: userdata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final _data = snapshot.data;
              return _data == null
                  ? Text("null")
                  : Text("Hello " + _data.displayName);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        backgroundColor: LibColors.primary_color,
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: pages,
            onPageChanged: onPageChanged,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (currentIndex) {
          pageController.jumpToPage(currentIndex);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history_edu,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: 'Home',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.tips_and_updates,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: 'Tips & Tricks',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: 'Consultation',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: 'Profile',
              backgroundColor: LibColors.primary_color)
        ],
      ),
    );
  }
}
