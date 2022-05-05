
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../model/newsModel.dart';
import '../services/Api_Manager.dart';

class Searched extends StatefulWidget {
  String data;
   Searched({Key? key,required this.data}) : super(key: key);

  @override
  _SearchedState createState() => _SearchedState();
}

class _SearchedState extends State<Searched> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool isLoaded = false;

  getNews(String da) async {
    //setState(() {
   // });
    News news = News(da);
    print(da);
    await news.getNews();
    articles = news.dataSavedin;
    if (articles != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String da=Strings().fn+widget.data+Strings().sn;

    getNews(da);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.data),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Expanded(
            child: Column(
              children: [
                ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: shar(
                          title: articles[index].title,
                          description: articles[index].description,
                          author: articles[index].author,
                          urlToImage: articles[index].urlToImage),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





class shar extends StatefulWidget {
  String title, description, author, urlToImage;

  shar(
      {Key? key,
        required this.title,
        required this.description,
        required this.author,
        required this.urlToImage})
      : super(key: key);

  @override
  _sharState createState() => _sharState();
}

class _sharState extends State<shar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
                imageUrl: widget.urlToImage,
                height: 100,
                width: 100,
                fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(widget.author,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
