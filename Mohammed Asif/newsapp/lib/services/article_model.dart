class Article {
  Article({
    required this.source,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.author,
  });

  final Source source;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  String content;
  String author;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"].toString(),
        description: json["description"].toString(),
        url: json["url"].toString(),
        urlToImage: json["urlToImage"].toString(),
        content: json["content"] == null ? null : json["content"],
      );
}

class Source {
  Source({
    required this.name,
  });
  String name;
  factory Source.fromJson(Map<String, dynamic> json) => Source(
        name: json["name"],
      );
}
