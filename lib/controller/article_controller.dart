import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getfit/models/article_model.dart';

class ArticleControlller{



  Future<List<ArticleModel>> getArticles({int? category}) async {
    try{

      if(category != null){
        var _doc = await FirebaseFirestore.instance.collection("articles").orderBy('category').orderBy('created_on',).get();
        List<ArticleModel> _result = _doc.docs.map((e) => ArticleModel.fromJson(e.data())).toList();
        return _result;
      }
      var _doc = await FirebaseFirestore.instance.collection("articles").orderBy('created_on',).get();

      List<ArticleModel> _result = _doc.docs.map((e) => ArticleModel.fromJson(e.data())).toList();
      print("dd");print("dd");
      return _result;
    }
    on FirebaseException catch (e){

      return List<ArticleModel>.empty();
    }
  }
}