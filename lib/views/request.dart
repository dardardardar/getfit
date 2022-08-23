import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getfit/controller/consultant_controller.dart';
import 'package:getfit/controller/user_controller.dart';
import 'package:getfit/models/chats_model.dart';
import 'package:getfit/models/user_model.dart';
import 'package:getfit/widgets/colors.dart';
import 'package:getfit/widgets/snackbar_widgets.dart';

class requestView extends StatefulWidget {
  const requestView({Key? key}) : super(key: key);

  @override
  State<requestView> createState() => _requestViewState();
}

String btnText = 'Accept';
var btnColor = LibColors.primary_color;
var btnColor2 = LibColors.color_white;
class _requestViewState extends State<requestView> {
  Future<List<ChatsModel>> future = ConsultantController().getRequests();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 8),
          child: Text("Request")
        ),
        backgroundColor: LibColors.primary_color,
      ),
      body: FutureBuilder<List<ChatsModel?>>(
        future: future,
        builder: (context, snapshot){
          if(snapshot.hasData){

            var data = snapshot.data!;
            if(data.isEmpty){
              return Center(child: Text("You have no chat requests"),);
            }
            return Container(
                child: SingleChildScrollView(
                  // child: Column(
                  //   children: <Widget>[
                  //     SizedBox(height: 8,),
                  //     reqCard(data);
                  //   ],
                  // ),
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, int index) {
                      return reqCard(data[index]!);
                    },
                    physics : NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  ),
                ),
              );

          }
          if(snapshot.hasError){
            print(snapshot.error.toString());
            return Center(
              child: Text('You have no chat requests'),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
  Widget reqCard(ChatsModel model,) {
    var userdata = UserController().readUserDatabyId(id: model.uid_user);

    return FutureBuilder<UserModel>(
        future: userdata,
        builder: (context, snapshot){
          if(snapshot.hasData){
            var data = snapshot.data!;

            return Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        Image(
                            image: AssetImage("assets/images/Ellipse.png"),
                            fit: BoxFit.cover),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            data.displayName,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      ConsultantController().approveChat(model).then((value){
                        setState(() {
                          btnText = 'Accepted';
                          btnColor = LibColors.color_grey;
                          btnColor2 = LibColors.color_black;
                          print(btnText);
                        });
                        SnackBarWidgets.success('Request Accepted');
                      }).onError((error, stackTrace) => SnackBarWidgets.fire(stackTrace.toString()));
                     
                    },
                    child:  Container(
                      width: 90,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: btnColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            btnText,
                            style: TextStyle(fontSize: 12, color: btnColor2),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        }
    );
  }
}


