import 'package:flutter/material.dart';
import 'package:newsapp/services/article_model.dart';

class NewsDescriptionPage extends StatelessWidget {
  final Article article;

  NewsDescriptionPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 36, 45, 60),
        title: Text(article.source.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                //let's add the height

                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Container(
              padding: EdgeInsets.all(2.0),
              child: Text(
                article.source.name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              article.description,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.0),
              child: Text(
                article.content,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
