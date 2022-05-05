


import 'dart:convert';

import 'package:globe/constants/strings.dart';
import 'package:http/http.dart';

import '../model/newsModel.dart';

class News{
  late String Url;

  News(this.Url);

  List<ArticleModel> dataSavedin=[];
  Future<void> getNews() async{
    var response= await get(Uri.parse(Url));
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData["articles"].forEach((element){
        if(element['urlToImage']!=null&&element['description']!=null){
          //iniitialize the model class
          ArticleModel articleModel=ArticleModel(
              element['title'],
              element['description'],
              element['url'],
              element['urlToImage'],
              element['author']??"Unidentified Author",
              element['content']??element['description'],
              element['publishedAt']);
          dataSavedin.add(articleModel);
        }
      });
    }
  }
}