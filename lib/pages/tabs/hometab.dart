import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globe/constants/strings.dart';

import '../../model/newsModel.dart';
import '../../services/Api_Manager.dart';
import '../../shared.dart';
import '../singleNewsPage.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<ArticleModel> articles=<ArticleModel>[];
  bool isLoaded=false;
  getNews()async{
    News news= News(Strings().TeslaNews);
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
          body: Visibility(
            visible: isLoaded,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Column(
                    children:  [
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>SingleNews(
                                  title: articles[index].title,
                                  author: articles[index].author,
                                  url: 'url',
                                  urlToImage: articles[index].urlToImage,
                                  description: articles[index].description,
                                ),
                              ));
                            },
                            child: Template(
                                title: articles[index].title,
                                description: articles[index].description,
                                url: 'url',
                                urlToImage: articles[index].urlToImage),
                          );

                        },
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Tesla News",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                            ),),
                        ),
                      ),
                      Shared(Url: Strings().TeslaNews,),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Apple News",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                            ),),
                        ),
                      ),
                      Shared(Url: Strings().AppleNews,),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Google News",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                            ),),
                        ),
                      ),
                      Shared(Url: Strings().googleNews,),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Football News",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                            ),),
                        ),
                      ),
                      Shared(Url: Strings().FootballNews,),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Art News",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                            ),),
                        ),
                      ),
                      Shared(Url: Strings().ArtNews,)
                    ],
                  ),
                ),
              ),
          ),
          ),
    );

  }
}
class Template extends StatefulWidget {
  String title,description,url,urlToImage;
  Template({Key? key,required this.title,required this.description,required this.url,required this.urlToImage}) : super(key: key);

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: CachedNetworkImage(
              imageUrl:widget.urlToImage,
              width: double.infinity,
              height:400, fit:BoxFit.cover
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
