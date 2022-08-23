import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/controller/consultant_controller.dart';
import 'package:getfit/controller/user_controller.dart';
import 'package:getfit/models/consultant_model.dart';
import 'package:getfit/models/user_model.dart';
import 'package:getfit/views/chatconsultantView.dart';
import 'package:getfit/views/chatuserView.dart';
import 'package:getfit/views/consultation.dart';
import 'package:getfit/widgets/colors.dart';
import 'package:intl/intl.dart';
class ConsultationMainView extends StatefulWidget {
  const ConsultationMainView({Key? key}) : super(key: key);

  @override
  State<ConsultationMainView> createState() => _ConsultationMainViewState();
}

class _ConsultationMainViewState extends State<ConsultationMainView> {
  final userdata = UserController().readUserDatabyId();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<UserModel?>(
      future: userdata,
      builder: (context,snapshot){
        if(snapshot.hasData){
          final _data = snapshot.data!;
          print("ddd"+_data.roles.toString());
          if(_data.roles == 0){

            return ConsultationView();
          }
          return ChatconsultantView();
        }
        if(snapshot.hasError){
          return Center(child: Text('Something wenrt wrong'),);
        }
        return  Center(child:CircularProgressIndicator());
      },
    );
  }
}
