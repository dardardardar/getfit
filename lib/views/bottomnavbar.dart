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
    ChatconsultantView(),
  ];

  int selectIndex = 0;

  void onPageChanged(int index) {
    selectIndex = index;
  }

  void onItemTap(int selectedItem) {
    pageController.jumpToPage(selectedItem);
  }
  final userdata = UserController().readUserDatabyId();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<UserModel?>(
          future: userdata,
          builder: (context,snapshot){
            if(snapshot.hasData){
              final _data = snapshot.data;
              return _data == null ?
              Text("null") :
              Text("Hello " + _data.displayName);
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
        backgroundColor: LibColors.primary_color,
      ),
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: LibColors.primary_color,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 185, 185, 185),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onItemTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history_edu,
              ),
              label: '',
              backgroundColor: Color.fromARGB(255, 185, 185, 185)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.tips_and_updates,
              ),
              label: '',
              backgroundColor: Color.fromARGB(255, 185, 185, 185)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              label: '',
              backgroundColor: Color.fromARGB(255, 185, 185, 185)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: '',
              backgroundColor: Color.fromARGB(255, 185, 185, 185))
        ],
      ),
    );
  }
}
