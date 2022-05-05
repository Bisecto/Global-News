import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:globe/constants/textDeco.dart';
import 'package:globe/pages/searched.dart';

import '../../constants/strings.dart';
import '../../model/newsModel.dart';
import '../../services/Api_Manager.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String Category = 'business';
  List<ArticleModel> articles = <ArticleModel>[];
  bool isLoaded = false;

  getNews() async {
    News news = News(Strings().fn+Category+Strings().sn);
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
    getNews();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Global News',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 1,
                  obscureText: false,
                  decoration:
                      textInputDecoration.copyWith(hintText: "Search here"),
                  onSubmitted: (val) {
                    if (val.toString().length < 2||val.toString().length>12) {
                    } else {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> Searched(data: val,),
                      ));
                    }
                  },
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Category = 'business';
                            isLoaded=false;
                            getNews();
                          });
                        },
                        child: Container(
                          // color: Colors.blue[400],
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blue),

                            /// color:Colors.white,
                          ),
                          width: (1 / 2.5) * MediaQuery.of(context).size.width,
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.business,
                                color: Colors.blue,
                                size: 20,
                              ),
                              Text("Business")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Category = 'health';
                            isLoaded=false;
                            getNews();
                          });
                        },
                        child: Container(
                          // color: Colors.blue[400],
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.green),

                            /// color:Colors.white,
                          ),
                          width: (1 / 2.5) * MediaQuery.of(context).size.width,
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.healing,
                                color: Colors.green,
                                size: 20,
                              ),
                              Text("Health")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoaded=false;
                            getNews();
                            Category = 'entertainment';
                          });
                        },
                        child: Container(
                          // color: Colors.blue[400],
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.yellow),

                            /// color:Colors.white,
                          ),
                          width: (1 / 2.5) * MediaQuery.of(context).size.width,
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.music_video,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Text("Entertainment")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoaded=false;
                            getNews();
                            Category = 'politics';
                          });
                        },
                        child: Container(
                          // color: Colors.blue[400],
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red),

                            /// color:Colors.white,
                          ),
                          width: (1 / 2.5) * MediaQuery.of(context).size.width,
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.policy,
                                color: Colors.red,
                                size: 20,
                              ),
                              Text("Politics")
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                Category.toUpperCase(),
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Visibility(
                visible: isLoaded,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Temp(
                          title: articles[index].title,
                          description: articles[index].description,
                          author: articles[index].author,
                          urlToImage: articles[index].urlToImage),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Temp extends StatefulWidget {
  String title, description, author, urlToImage;

  Temp(
      {Key? key,
      required this.title,
      required this.description,
      required this.author,
      required this.urlToImage})
      : super(key: key);

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Flexible(
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Flexible(
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
