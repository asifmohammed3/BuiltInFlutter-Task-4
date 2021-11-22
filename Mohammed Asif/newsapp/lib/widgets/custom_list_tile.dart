import 'package:flutter/material.dart';
import 'package:newsapp/news_description_page.dart';
import 'package:newsapp/services/article_model.dart';

Widget customListTile(Article article, BuildContext context) {
  Widget authorText() {
    if (article.author.length < 25) {
      return Text(
        article.author,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black,
        ),
      );
    } else {
      return const Text("");
    }
  }

  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDescriptionPage(
                    article: article,
                  )));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ]),
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
            height: 8.0,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            article.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  article.source.name,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.document_scanner,
                      size: 13,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    authorText()
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
