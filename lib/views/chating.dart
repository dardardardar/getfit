import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/controller/consultant_controller.dart';
import 'package:getfit/models/message_model.dart';
import 'package:getfit/widgets/colors.dart';
import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}


class _ChatViewState extends State<ChatView> {

  @override
  Widget build(BuildContext context) {
    final _uid = FirebaseAuth.instance.currentUser!.uid;
    TextEditingController messageController = TextEditingController();
    @override
    void dispose(){
      messageController.dispose();
    }

    return Scaffold(
      appBar: AppBar(

        title: Container(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18.0,
                backgroundImage:  AssetImage("assets/images/personaltrainer.png"),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(12),
                child: Container(child: Text('Dr. Thomas S'),),
              )
            ],
          ),
        ),

        backgroundColor: LibColors.primary_color,
      ),
      body: Column(
        children: [
          StreamBuilder<List<MessagesModel>>(
            stream: ConsultantController().getMessages(),
            builder: (context,snapshot){
              final models = snapshot.data;

              if(snapshot.hasData){

                return Expanded(
                    child: GroupedListView<MessagesModel, DateTime>(
                      padding: EdgeInsets.all(12),
                      elements: models!,
                      groupBy: (model) => DateTime(
                        model.createdOn.year,
                        model.createdOn.month,
                        model.createdOn.day,
                      ),
                      reverse: true,
                      order: GroupedListOrder.DESC,

                      groupHeaderBuilder: (MessagesModel model) => SizedBox(
                        height: 50,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(12),

                            child: Text(
                              DateFormat.yMMMd().format(model.createdOn),
                              style: TextStyle(color: LibColors.primary_color,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      itemBuilder: (context, MessagesModel model) => Align(
                        alignment: model.uid == _uid ?
                        Alignment.centerRight :
                        Alignment.centerLeft,
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            constraints: BoxConstraints(minWidth: 0, maxWidth: 200),
                            decoration: BoxDecoration(
                              color: model.uid == _uid ? LibColors.color_white : LibColors.second_color,
                              borderRadius: BorderRadius.only(
                                topLeft: model.uid == _uid ? Radius.circular(12) : Radius.circular(0),
                                topRight: model.uid == _uid ? Radius.circular(0) : Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              boxShadow:  [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 5), // changes position of shadow
                                ),
                              ],//BorderRadius.Only
                            ),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(DateFormat.Hm().format(model.createdOn) , style: TextStyle(
                                  color: model.uid == _uid ? LibColors.primary_color : LibColors.color_white,
                                  fontSize: 10,
                                ),
                                ),
                                SizedBox(height: 8,),
                                Text(model.messages , style: TextStyle(color: model.uid == _uid ? LibColors.primary_color : LibColors.color_white),),
                              ],
                            )
                        ),
                      ),
                    )
                );
              }
              if(snapshot.hasError){
                Expanded(child: Center(child: Text(snapshot.error.toString()),));
              }
              return Expanded(child: Center(child: CircularProgressIndicator(),));
            },
          ),
          Container(
            decoration: BoxDecoration(
              color: LibColors.color_white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                    decoration: BoxDecoration(
                      color: LibColors.color_grey,
                      borderRadius: BorderRadius.circular(36)
                    ),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Type here...",
                      ),

                    ),
                  )
                ),

                MaterialButton(onPressed: (){
                  final message = MessagesModel(uid:FirebaseAuth.instance.currentUser!.uid,messages: messageController.text, createdOn: DateTime.now());

                  ConsultantController().sendMessage(message);
                  messageController.clear();
                },
                child: Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: LibColors.primary_color,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Icon(Icons.arrow_forward_rounded,color: LibColors.color_white),
                ),)
              ],
            ),
          )
        ],
      ),
    );


  }

}
