import 'dart:convert';
import 'package:newsindia/model/articleModel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=ef7681e7da174683a5e522b08a0b8121';

    var response = await http.get(url);

    var jsondata = jsonDecode(response.body);


    if (jsondata['status'] == 'ok') {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              desc: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt']);

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsNow {
  List<ArticleModel> news = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=64f04510b86c4217ad8eb14178148b40';

    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);

    if (jsondata['status'] == 'ok') {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              desc: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt']);

          news.add(articleModel);
        }
      });
    }
  }
}
