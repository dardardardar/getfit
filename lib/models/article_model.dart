import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {

  final String title;
  final String content;
  final String imageUrl;
  final int category;
  final DateTime createdOn;

  ArticleModel({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.category,
    required this.createdOn,
  });



  static ArticleModel fromJson(Map<String, dynamic> json) => ArticleModel(
    title: json['title'],
    content: json['content'],
    imageUrl: json['imageUrl'],
    category: json['category'],
    createdOn: (json['createdOn'] as Timestamp).toDate(),
  );


}