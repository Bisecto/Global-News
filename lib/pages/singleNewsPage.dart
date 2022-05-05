import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingleNews extends StatefulWidget {
  String title,description,url,urlToImage,author;
   SingleNews({Key? key,required this.title,required this.description,required this.url,required this.urlToImage,required this.author}) : super(key: key);

  @override
  _SingleNewsState createState() => _SingleNewsState();
}

class _SingleNewsState extends State<SingleNews> {
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
    ),
      child: Scaffold(
        body: Column(
          children: [
            Stack(
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Author: ${widget.author}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),),
            ),
          ],
        ),
    )
    );
  }
}
