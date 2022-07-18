import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getfit/models/chats_model.dart';
import '../models/consultant_model.dart';
import '../models/message_model.dart';

class ConsultantController{
  Future<List<ConsultantModel>> getConsultants() async {
    try{
      var _doc = await FirebaseFirestore.instance.collection("consultants").get();
      List<ConsultantModel> _result = _doc.docs.map((e) => ConsultantModel.fromJson(e.data())).toList();
      print(_result.first.rating);
      return _result;
    }
    on FirebaseException catch (e){
      print(e);
      return List<ConsultantModel>.empty();
    }
  }

  Future sendMessage(MessagesModel model) {
    // var _user = FirebaseAuth.instance.currentUser!;

    final _chatDoc = FirebaseFirestore.instance.collection('chat_rooms').doc('iUwl3cUc1d0hoH1QyCuh').collection("messages");
    final _json = model.toJson();
    return _chatDoc.add(_json);
  }
  Stream<List<MessagesModel>> getMessages(){
    return FirebaseFirestore.instance.collection('chat_rooms').doc('iUwl3cUc1d0hoH1QyCuh').collection('messages').orderBy('created_on').snapshots().map((sn){

      return sn.docs.map((doc) => MessagesModel.fromJson(doc.data())).toList();
    });
  }
  Future<void> getChat()async {
    var _uid = FirebaseAuth.instance.currentUser!.uid;
    var _a = FirebaseFirestore.instance.collection('chat_room').where('user_uid' ,isEqualTo: _uid).get();
  }
}