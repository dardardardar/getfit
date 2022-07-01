import "package:flutter/material.dart";
import 'package:getfit/widgets/colors.dart';

import '../widgets/text_widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _pageOne()
            ],
          )
        ],
      )
    );
  }

  Widget _pageOne(){
    return Container(
      padding: EdgeInsets.all(12),
      color: LibColors.primary_color,
      // child: Align(
      //   child:textTitleAlt("We'd like to ask you some questions to help us get to know you")
      // )
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              child:textTitleAlt("We'd like to ask you some questions to help us get to know you")
          ),

        ],
      ),
    );
  }

  // MaterialButton(onPressed: (){},
  // minWidth: 360,
  // color: LibColors.color_white,
  // child: Text(
  //
  // "Continue" ,style: const TextStyle(
  // fontSize: 16,
  // color: LibColors.primary_color,
  // ),
  // textAlign: TextAlign.center,
  // )
  // ),
  // MaterialButton(onPressed: (){},
  //
  // child: Text(
  // "Back" ,style: const TextStyle(
  // fontSize: 16,
  // color: LibColors.color_white,
  // ),
  // textAlign: TextAlign.center,
  // )
  // )
}
