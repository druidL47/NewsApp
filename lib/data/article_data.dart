// import 'package:news_app/model/category_model.dart';

import '../model/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=103f664a49124c36b55a272029bd1039';
    var response = await http.get(url);
    var jsonDate = jsonDecode(response.body);
    if (jsonDate['status'] == 'ok') {
      jsonDate['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
// class NewsForCategorie {

//   List<ArticleModel> news  = [];

//   Future<void> getNewsForCategory(String category) async{

//     /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
//     String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=103f664a49124c36b55a272029bd1039";

//     var response = await http.get(url);

//     var jsonData = jsonDecode(response.body);

//     if(jsonData['status'] == "ok"){
//       jsonData["articles"].forEach((element){

//         if(element['urlToImage'] != null && element['description'] != null){
//           ArticleModel article = ArticleModel(
//             title: element['title'],
//             author: element['author'],
//             description: element['description'],
//             urlToImage: element['urlToImage'],
//             publshedAt: DateTime.parse(element['publishedAt']),
//             content: element["content"],
//             articleUrl: element["url"],
//           );
//           news.add(article);
//         }

//       });
//     }

//   }

// }
class NewsSortByCategory {
  List<ArticleModel> newsSortBy = [];
  Future<void> getNewsBy(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=103f664a49124c36b55a272029bd1039";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          newsSortBy.add(article);
        }
      });
    }
  }
}
