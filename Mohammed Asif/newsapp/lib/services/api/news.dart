// import 'dart:convert';
// // import 'dart:ui' as ui;
// import 'package:http/http.dart' as http;
// import 'package:newsapp/services/article_model.dart';

// class News {
//   String url =
//       "https://newsapi.org/v2/top-headlines?country=us&apiKey=44e7a08cf456497885a3b70dc3baaada";
//   Future<Article> getNews() async {
//     var client = http.Client();

//     var response = await client.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       print(Article.fromJson(jsonDecode(response.body)));
//       return Article.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception("API not called successfully");
//     }
//   }
// }

//

import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/services/article_model.dart';

class News {
  // final endPointUrl =
  //     "https://newsapi.org/v2/top-headlines?country=in&apiKey=44e7a08cf456497885a3b70dc3baaada";

  final endPointUrl =
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=44e7a08cf456497885a3b70dc3baaada";
  Future<List<Article>> getArticle() async {
    var response = await get(Uri.parse(endPointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];

      List<Article> articles = [];
      for (json in body) {
        if (json["source"]["name"] != null &&
            json["title"] != null &&
            json["description"] != null &&
            json["url"] != null &&
            json["urlToImage"] != null &&
            json["author"] != null &&
            json["content"] != null) articles.add(Article.fromJson(json));
      }
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
