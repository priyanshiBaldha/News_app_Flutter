import 'package:flutter/material.dart';
import 'package:news_app/views/component/futureBuilder.dart';
import 'package:provider/provider.dart';
import '../../controller/global/global.dart';
import '../../controller/helpers/news_helper.dart';
import '../../controller/providers/connection_provider.dart';
import '../component/no_internet.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: Global.category.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: Global.category
              .map(
                (e) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Text(
                    e.category,
                  ),
                ),
              )
              .toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: Global.category
                .map(
                  (e) => (Provider.of<ConnectionProvide>(context).isOffline)
                      ? noInternet(context: context)
                      : futureBuilder(
                          future: NewsHelper.newsHelper
                              .getNewsCategoryWise(category: e.category),
                        ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
