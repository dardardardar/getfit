import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getfit/models/article_model.dart';

class ArticleControlller{



  Future<List<ArticleModel>> getConsultants({int? category}) async {
    try{
      var _doc = await FirebaseFirestore.instance.collection("articles").orderBy('createdOn').get();
      List<ArticleModel> _result = _doc.docs.map((e) => ArticleModel.fromJson(e.data())).toList();
      if(category != null){

      }
      return _result;
    }
    on FirebaseException catch (e){
      print(e);
      return List<ArticleModel>.empty();
    }
  }
}