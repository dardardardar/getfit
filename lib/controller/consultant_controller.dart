import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getfit/models/chats_model.dart';
import '../models/consultant_model.dart';
import '../models/message_model.dart';
import '../widgets/snackbar_widgets.dart';


class ConsultantController{
  Future<List<ConsultantModel>> getConsultants({required String name}) async {
    try{
      var _doc = await FirebaseFirestore.instance.collection("consultants").get();
      List<ConsultantModel> result = _doc.docs.map((e) => ConsultantModel.fromJson(e.data())).toList();
      if(name != ''){
        return result.where((element){
          return element.displayName.toLowerCase().contains(name.toLowerCase());
        }).toList();
      }
      //print(_result.first.rating);
      return result;
    }
    on FirebaseException catch (e){
       SnackBarWidgets.fire(e.message);
      return List<ConsultantModel>.empty();
    }
  }

  Future sendMessage({required String chatRoomId,required MessagesModel model}) {
    final _chatDoc = FirebaseFirestore.instance.collection('chat_rooms').doc(chatRoomId).collection("messages");
    final _json = model.toJson();
    return _chatDoc.add(_json);
  }

  Stream <List<MessagesModel>> getMessages({required String chatRoomId}){
    return FirebaseFirestore.instance.collection('chat_rooms').doc(chatRoomId).collection('messages').orderBy('created_on').snapshots().map((sn){
      return sn.docs.map((doc) => MessagesModel.fromJson(doc.data())).toList();
    });
  }
  Stream <List<ChatsModel>> getChatRoomList({bool? isUser}) {
    try {
      if(isUser!){
        var _uid = FirebaseAuth.instance.currentUser!.uid;
        return FirebaseFirestore.instance.collection('chat_rooms').where(
            'uid_user', isEqualTo: _uid).where('is_open', isEqualTo: true).orderBy('created_on').snapshots().map((
            sn) {
          return sn.docs.map((e) => ChatsModel.fromJson(e.data())).toList();
        });
      }
      var _uid = FirebaseAuth.instance.currentUser!.uid;
      return FirebaseFirestore.instance.collection('chat_rooms').where(
          'uid_consultant', isEqualTo: _uid).where('is_open', isEqualTo: true).orderBy('created_on').snapshots().map((
          sn) {
        return sn.docs.map((e) => ChatsModel.fromJson(e.data())).toList();
      });
    }

    on FirebaseException catch (e) {
      SnackBarWidgets.fire(e.message);
      return const Stream<List<ChatsModel>>.empty();
    }
  }
  Future <List<ChatsModel>> getRequests() async{
    try {
      var _uid = FirebaseAuth.instance.currentUser!.uid;
      var doc =  await FirebaseFirestore.instance.collection('chat_rooms')
          .where('uid_consultant', isEqualTo: _uid)
          .where('is_open', isEqualTo: false)
          .orderBy('created_on').get();

      List<ChatsModel> _result = doc.docs.map((e) => ChatsModel.fromJson(e.data())).toList();
      print(_result.first.id);
      return _result;
    }

    on FirebaseException catch (e) {
      SnackBarWidgets.fire(e.message);
      return List<ChatsModel>.empty();
    }
  }
  Future requestChat(String uid) async{
    String id = '';
    var userUid = FirebaseAuth.instance.currentUser!.uid;
    var docs = FirebaseFirestore.instance.collection('chat_rooms');
    var model = ChatsModel(uid_user: userUid, uid_consultant: uid, is_open: false, created_on: DateTime.now());
    var json = model.toJson();
    await docs.add(json).then((value) => id = value.id);

    var docs2 = FirebaseFirestore.instance.collection('chat_rooms').doc(id);
    model.id = id;
    json = model.toJson();
    return  docs2.set(json).then(
            (value) => SnackBarWidgets.success('Your request has been sent')
    ).onError(
            (error, stackTrace) => SnackBarWidgets.fire('An error has been occurred')
    );

  }
  Future approveChat(ChatsModel model) async{

    var docs = FirebaseFirestore.instance.collection('chat_rooms').doc(model.id);
    model.is_open = true;
    var json = model.toJson();
    return await  docs.set(json).then(
            (value) => SnackBarWidgets.success('Your request has been sent')
    ).onError(
            (error, stackTrace) => SnackBarWidgets.fire('An error has been occurred')
    );

  }
  // Future<List<ChatsModel>> getChatRequests(){
  //   try{
  //     var user_uid = FirebaseAuth.instance.currentUser!.uid;
  //     var docs = FirebaseFirestore.instance.collection('chat_rooms').where(field);
  //   }
  //   on FirebaseException catch (e){
  //
  //   }
  // }
}