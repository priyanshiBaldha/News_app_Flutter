import 'package:dio/dio.dart';
import 'package:news_app/modals/news_modal.dart';
import 'package:provider/provider.dart';

import '../providers/news_provider.dart';

class NewsHelper {
  NewsHelper._();
  static final NewsHelper newsHelper = NewsHelper._();
  Dio dio = Dio();
  Future<List<News>> getHeadLineNews() async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=ef019968bc8b4c04970d21485130fbc4");
    List data = response.data["articles"];

    List<News> newsList = data.map((e) => News.fromMap(data: e)).toList();

    return newsList;
  }

  Future<List<News>> getNewsCategoryWise({required String category}) async {
    Response response = await dio.get(
      "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=ef019968bc8b4c04970d21485130fbc4"
     );
    List data = response.data["articles"];

    List<News> newsList = data.map((e) => News.fromMap(data: e)).toList();

    return newsList;
  }

  searchNews({required String search, context}) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=in&category=$search&apiKey=ef019968bc8b4c04970d21485130fbc4");
    List data = response.data["articles"];

    List<News> newsList = data.map((e) => News.fromMap(data: e)).toList();

    Provider.of<NewsProvider>(context, listen: false)
        .setSearchList(search: newsList);
  }
}
