import 'dart:convert';

import 'package:globe/constants/strings.dart';
import 'package:http/http.dart';

import '../model/article.dart';
import '../model/newsModel.dart';

class NewsRepository{
  String Url='https://newsapi.org/v2/everything?q=football&from=2023-03-08&sortBy=publishedAt&apiKey=bdd7f0517dd34647bd22832d9b584c74';
   Future<List<Article>> getNews() async{
    var response= await get(Uri.parse(Url));
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      final List result=jsonData['articles'];
      return result.map(((e) =>Article.fromJson(e))).toList();
      // jsonData["articles"].forEach((element){
      //   if(element['urlToImage']!=null&&element['description']!=null){
      //     //iniitialize the model class
      //     ArticleModel articleModel=ArticleModel(
      //         element['title'],
      //         element['description'],
      //         element['url'],
      //         element['urlToImage'],
      //         element['author']??"Unidentified Author",
      //         element['content']??element['description'],
      //         element['publishedAt']);
      //     print(articleModel);
      //     dataSavedin.add(articleModel);
      //   }
      // });
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}