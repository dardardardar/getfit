import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getfit/views/chatconsultantView.dart';
import 'package:getfit/views/consultation.dart';
import 'package:getfit/views/home_view.dart';
import 'package:getfit/views/profile.dart';
import 'package:getfit/views/tipsandtrick.dart';
import 'package:getfit/widgets/colors.dart';

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
    ChatconsultantView(),
  ];

  int selectIndex = 0;

  void onPageChanged(int index) {
    selectIndex = index;
  }

  void onItemTap(int selectedItem) {
    pageController.jumpToPage(selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onItemTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history_edu,
                color: selectIndex == 0
                    ? Color.fromARGB(255, 255, 255, 255)
                    : Color.fromARGB(255, 255, 255, 255),
              ),
              label: 'Home',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.tips_and_updates,
                color: selectIndex == 1
                    ? Color.fromARGB(255, 255, 255, 255)
                    : Color.fromARGB(255, 255, 255, 255),
              ),
              label: 'Tips & Tricks',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: selectIndex == 2
                    ? Color.fromARGB(255, 255, 255, 255)
                    : Color.fromARGB(255, 255, 255, 255),
              ),
              label: 'Consultation',
              backgroundColor: LibColors.primary_color),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: selectIndex == 3
                    ? Color.fromARGB(255, 255, 255, 255)
                    : Color.fromARGB(255, 255, 255, 255),
              ),
              label: 'Profile',
              backgroundColor: LibColors.primary_color)
        ],
      ),
    );
  }
}
