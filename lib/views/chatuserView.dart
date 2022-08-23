import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfit/widgets/colors.dart';

import '../controller/consultant_controller.dart';
import '../controller/user_controller.dart';
import '../models/chats_model.dart';
import '../models/message_model.dart';
import '../models/user_model.dart';
import 'bottomnavbar.dart';
import 'chating.dart';
import 'package:intl/intl.dart';
class ChatuserView extends StatefulWidget {
  const ChatuserView({Key? key}) : super(key: key);

  @override
  State<ChatuserView> createState() => _ChatuserViewState();
}

class _ChatuserViewState extends State<ChatuserView> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    var stream = ConsultantController().getChatRoomList(isUser: true);
    return Scaffold(
      appBar: AppBar(
        title:  Text('Chat'),
        backgroundColor: LibColors.primary_color,
      ),
      body:StreamBuilder<List<ChatsModel>>(
        stream: stream,
        builder: (context, snapshot){
          if(snapshot.hasData){
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,int index){
                return StreamBuilder<List<MessagesModel>>(
                  stream: ConsultantController().getMessages(chatRoomId: data[index].id!),
                  builder: (context, snapshot2){
                    if(snapshot2.hasData){
                      var data2 = snapshot2.data!;

                      if(data2.isEmpty){
                        return chatCard(model: MessagesModel(messages: "Click here to start consultation!", createdOn: DateTime.now()),model2: data[index]);
                      }
                      return chatCard(model: data2.last,model2: data[index]);
                    }
                    return Container();
                  },
                );
              },
              physics : NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
  Widget chatCard({required MessagesModel model,required ChatsModel model2}) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ChatView(model: model2,isUser: true,)));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: LibColors.color_grey,
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  FutureBuilder<UserModel>(
                    future: UserController().readUserDatabyId(id: model2.uid_consultant) ,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        var data = snapshot.data!;
                        return Container(
                          width: 170,
                          child: Text(
                            data.displayName,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                  SizedBox(height: 4,),
                  Container(
                    width: 170,
                    child: Text(
                      model.messages,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    DateFormat.Hm().format(model.createdOn),
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget _chatCard(String name, String txt,) {
  return Container(
    padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
    margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: [
             CircleAvatar(
               radius: 30.0,
               backgroundImage:  AssetImage("assets/images/personaltrainer.png"),
             )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                width: 170,
                child: Text(
                  name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              SizedBox(height: 4,),
              Container(
                width: 170,
                child: Text(
                  txt,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                '19.52',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
