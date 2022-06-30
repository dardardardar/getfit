import 'dart:ffi';

import 'package:flutter/material.dart';
import '../widgets/colors.dart';
import 'package:getfit/views/welcome_view.dart';


class SplashScreenView extends StatefulWidget {
  const SplashScreenView({ Key? key }) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState(){
    super.initState();
    _navHome();
  }
  _navHome() async{
    await Future.delayed(const Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeView()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
      color: Color(0xff134842),
      child: const Center(
        child: Text(
          "Logo" ,style: TextStyle(
            fontSize: 48,
            color: Color(0xffffffff)
            )
          )
        ),
      ),
    );
  }
}