import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getfit/models/message_model.dart';

class ChatsModel{
   String? id = '';
  final String uid_user;
  final String uid_consultant;
   bool is_open;
  final DateTime created_on;


  ChatsModel({
    this.id,
    required this.uid_user,
    required this.uid_consultant,
    required this.is_open,
    required this.created_on
  });

  Map<String , dynamic> toJson() =>{
    'id': id,
    'uid_user': uid_user,
    'uid_consultant': uid_consultant,
    'is_open': is_open,
    'created_on' : created_on,
  };
   static ChatsModel fromJson(Map<String, dynamic> json) => ChatsModel(
     id: json['id'],
    uid_user: json['uid_user'],
    uid_consultant: json['uid_consultant'],
     is_open: json['is_open'],
     created_on: (json['created_on']as Timestamp).toDate(),
  );
}