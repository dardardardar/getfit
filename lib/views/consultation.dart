import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/controller/consultant_controller.dart';
import 'package:getfit/controller/user_controller.dart';
import 'package:getfit/models/consultant_model.dart';
import 'package:getfit/views/chatuserView.dart';
import 'package:getfit/widgets/colors.dart';

import 'chating.dart';

class ConsultationView extends StatefulWidget {
  const ConsultationView({Key? key}) : super(key: key);

  @override
  State<ConsultationView> createState() => _ConsultationViewState();
}


class _ConsultationViewState extends State<ConsultationView> {
  List<ConsultantModel> _data = [];
  Future<List<ConsultantModel>> _consultantData = ConsultantController().getConsultants(name: '');

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        backgroundColor: LibColors.primary_color,

        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ChatuserView()));
        },
      ),

      body:FutureBuilder<List<ConsultantModel>>(
        future: _consultantData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
           _data = snapshot.data!;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(12),
                      child: TextField(
                        textInputAction: TextInputAction.go,
                        onSubmitted: (query){
                          setState(() {
                            print("ddd");
                            _consultantData = ConsultantController().getConsultants(name: query);
                            //_consultantData = ConsultantController().getConsultants(name: query);
                          });
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "Search Your Personal Consultant",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: LibColors.primary_color, width: 1.0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintStyle: TextStyle(color: LibColors.primary_color)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(12),
                      child: Text('Recommended Personal Trainer or Doctor'),
                    ),
                    ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, int index) {
                        return profileCard(_data[index],context);
                      },
                      physics : NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // children: _data.map(profileCard).toList(),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  searchConsultant(String query,List<ConsultantModel> list) {

  }
}

Widget profileCard(ConsultantModel model,context) {

  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: LibColors.color_white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 5), // changes position of shadow
        ),
      ],
    ),
    // color: Color.fromARGB(255, 231, 231, 231),
    child: Row(
      children: <Widget>[
        Container(
          width: 130,
          height: 140,
          child: Image(
              image: AssetImage("assets/images/personaltrainer.png"),
              fit: BoxFit.fill),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  model.displayName,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                ),
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: LibColors.second_color,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        model.experience.toString() + ' Tahun',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 11, color: LibColors.color_white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(4, 8, 0, 4),
                alignment: Alignment.topLeft,
                child: Text(
                  model.price <= 0 ? "Free" : model.price.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: MaterialButton(
                    color: LibColors.primary_color,
                    onPressed: () {
                      ConsultantController().requestChat(model.uid!);
                    },
                    child: Text(
                      'Request',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}

