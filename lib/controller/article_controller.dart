import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getfit/models/article_model.dart';

import '../widgets/snackbar_widgets.dart';

class ArticleControlller{

  Future<List<ArticleModel>> getArticles({int? category}) async {
    try{
      if(category != null){
        var _doc = await FirebaseFirestore.instance.collection("articles").where("category",isEqualTo: category).orderBy('created_on',).get();
        List<ArticleModel> _result = _doc.docs.map((e) => ArticleModel.fromJson(e.data())).toList();
        return _result;
      }
      var _doc = await FirebaseFirestore.instance.collection("articles").orderBy('created_on',).get();
      List<ArticleModel> _result = _doc.docs.map((e) => ArticleModel.fromJson(e.data())).toList();
      return _result;
    }
    on FirebaseException catch (e){
      SnackBarWidgets.fire(e.message);
      return List<ArticleModel>.empty();
    }
  }
}