import 'package:flutter/material.dart';
import 'package:newsapp/services/api/news.dart';
import 'package:newsapp/services/article_model.dart';
import 'package:newsapp/widgets/custom_list_tile.dart';

class CustomNewsTile extends StatefulWidget {
  // String urlToImage;
  // DateTime publishedAt;

  @override
  State<CustomNewsTile> createState() => _CustomNewsTileState();
}

class _CustomNewsTileState extends State<CustomNewsTile> {
  News client = News();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;

            var i = articles!.length;

            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles.length,

              itemBuilder: (context, i) => customListTile(articles[i], context),
            );
          }
          // else if (snapshot.hasError) {
          //   return Text('${snapshot.error}');
          // }

          // By default, show a loading spinner.
          return Center(child: const CircularProgressIndicator());
        });
  }
}
