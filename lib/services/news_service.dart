import 'dart:convert';
import 'package:flutter_application_1/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static const url = 'https://news-appli.herokuapp.com/news/categorie/';

  Future<List<News>?> getNews(String category) async {
    var response = await http.get(Uri.parse('$url$category'));
    List<News> news = [];
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var item in jsonData) {
        news.add(News.fromJson(item));
      }
      return news;
    }
  }
}
