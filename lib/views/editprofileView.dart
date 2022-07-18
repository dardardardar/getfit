import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';
import 'package:intl/intl.dart';
import '../controller/user_controller.dart';
import '../models/user_model.dart';
import 'bottomnavbar.dart';

class editprofileView extends StatefulWidget {
  const editprofileView({Key? key}) : super(key: key);

  @override
  State<editprofileView> createState() => _editprofileViewState();
}

class _editprofileViewState extends State<editprofileView> {
  final userdata = UserController().readUserDatabyId();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: LibColors.primary_color,
      ),
      floatingActionButton:  FloatingActionButton.extended(
        onPressed: () {  },
        label: Text("Save", style: TextStyle(color: LibColors.color_white,fontWeight: FontWeight.bold),),
        backgroundColor: LibColors.primary_color,
        extendedPadding: EdgeInsets.symmetric(horizontal: 160),

      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
      body:FutureBuilder<UserModel?>(
        future: userdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _data = snapshot.data!;
            return  Container(
                margin: EdgeInsets.all(12),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                    child: Column(

                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 350,
                          height: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: _data.displayName.toString(),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.create),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 350,
                          height: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: _data.height.toString() + " CM",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.create),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 350,
                          height: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: _data.weight.toString() + " KG",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.create),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 350,
                          height: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: DateFormat.yMMMMd().format(_data.dob),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.create),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 350,
                          height: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: _data.gender == 0 ? "Male" : "Female",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.create),
                            ),
                          ),
                        ),
                       Container(
                         constraints: BoxConstraints(
                           minHeight: 380
                         ),
                       ),

                        // editprofileCard(),
                      ],
                      
                    )));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

    );
  }
}

Widget editprofileCard() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Container(
                    width: 170,
                    child: Text(
                      'Bambang Atkinson',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image(
                      image: AssetImage("assets/images/editicon.png"),
                      fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
        // color: LibColors.second_color,
      ));
}
