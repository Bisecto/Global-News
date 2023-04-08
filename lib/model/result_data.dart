// To parse this JSON data, do
//
//     final newsApiModel = newsApiModelFromJson(jsonString);

import 'dart:convert';

import 'article.dart';

NewsApiModel newsApiModelFromJson(String str) => NewsApiModel.fromJson(json.decode(str));

String newsApiModelToJson(NewsApiModel data) => json.encode(data.toJson());

class NewsApiModel {
  NewsApiModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory NewsApiModel.fromJson(Map<String, dynamic> json) => NewsApiModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}
