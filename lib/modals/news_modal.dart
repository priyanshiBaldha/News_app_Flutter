class News {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String image;
  final String url;
  final String publishedTime;
  final String content;

  News({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.publishedTime,
    required this.content,
  });

  factory News.fromMap({required Map data}) {
    return News(
      sourceName: data["source"]["name"].toString(),
      author: data["author"].toString(),
      title: data["title"].toString(),
      description: data["description"].toString(),
      url: data["url"].toString(),
      image: data["urlToImage"].toString(),
      publishedTime: data["publishedAt"].toString(),
      content: data["content"].toString(),
    );
  }
}
