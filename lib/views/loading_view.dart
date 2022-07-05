import 'dart:ffi';

import 'package:flutter/material.dart';
import '../main.dart';
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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Mainpage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
      color: Color(0xff134842),
      child: const Center(
        child: Image(image: AssetImage("assets/images/getfit-03.png"), fit: BoxFit.cover, width: 320,)
        ),
      ),
    );
  }
}