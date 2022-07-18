import 'package:cloud_firestore/cloud_firestore.dart';


class MessagesModel{
  String? uid;
  String messages;
  DateTime createdOn;

  MessagesModel({
    this.uid = '',
    required this.messages,
    required this.createdOn,
});

  Map<String , dynamic> toJson() =>{
    'uid': uid,
    'messages': messages,
    'created_on': createdOn,

  };

  static MessagesModel fromJson(Map<String, dynamic> json) => MessagesModel(
    uid: json['uid'],
    messages: json['messages'],
    createdOn: (json['created_on'] as Timestamp).toDate(),

  );
}