import 'package:getfit/models/message_model.dart';

class ChatsModel{
  final String uid_user;
  final String uid_consultant;
  final bool is_open;



  ChatsModel({
    required this.uid_user,
    required this.uid_consultant,
    required this.is_open,

  });

  Map<String , dynamic> toJson() =>{
    'uid_user': uid_user,
    'uid_consultant': uid_consultant,
    'is_open': is_open,
  };

   static ChatsModel fromJson(Map<String, dynamic> json) => ChatsModel(
    uid_user: json['uid_user'],
    uid_consultant: json['uid_consultant'],
    is_open: json['is_open'],
  );

}