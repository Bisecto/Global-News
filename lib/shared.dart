
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:globe/model/newsModel.dart';
import 'package:globe/pages/singleNewsPage.dart';
import 'package:globe/services/Api_Manager.dart';

import 'constants/strings.dart';

class Shared extends StatefulWidget {
  String Url;
   Shared({Key? key,required this.Url}) : super(key: key);

  @override
  _SharedState createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  List<ArticleModel> articles=<ArticleModel>[];
  bool isLoaded=false;
  getNews()async{
    News news= News(widget.Url);
    await news.getNews();
    articles=news.dataSavedin;
    if(articles!=null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount:articles.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>SingleNews(
                  title: articles[index].title,
                  author: articles[index].author,
                  url: 'url',
                  urlToImage: articles[index].urlToImage,
                  description: articles[index].description,),
              ));
            },
            child: SharedTemplate(
                title: articles[index].title,
                description: articles[index].description,
                url: 'url',
                urlToImage: articles[index].urlToImage,
              author: articles[index].author,),

          );

        },
      )
      ,
    );
  }
}
class SharedTemplate extends StatefulWidget {
  String title,description,url,urlToImage,author;
  SharedTemplate({Key? key,required this.title,required this.description,required this.url,required this.urlToImage,required this.author}) : super(key: key);

  @override
  _SharedTemplateState createState() => _SharedTemplateState();
}

class _SharedTemplateState extends State<SharedTemplate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 170,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                  imageUrl:widget.urlToImage,
                  width: 160,
                  height:120, fit:BoxFit.cover
              ),
            ),
            Text(widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 13,
              ),),
            Align(
              alignment: Alignment.topLeft,
              child: Text('By ${widget.author.substring(0,8)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 11,
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
