import 'package:flutter/material.dart';
import 'package:news_app/modals/news_modal.dart';
import 'package:provider/provider.dart';
import '../../controller/providers/news_provider.dart';

Widget newsContainer({required News news, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Provider.of<NewsProvider>(context, listen: false)
            .setSelectedNews(news: news);
        Navigator.of(context).pushNamed("details_page");
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              (news.image == "null")
                  ? "https://puducherry-dt.gov.in/wp-content/themes/district-theme-2/images/blank.jpg"
                  : news.image,
            ),
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: Text(
            (news.title == "null") ? "" : news.title,
            style: Theme.of(context).textTheme.titleMedium?.merge(
                  const TextStyle(
                    color: Colors.white,
                  ),
                ),
          ),
        ),
      ),
    ),
  );
}
