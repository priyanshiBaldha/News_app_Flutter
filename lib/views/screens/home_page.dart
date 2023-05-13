import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/views/component/futureBuilder.dart';
import 'package:news_app/views/screens/category_page.dart';
import 'package:provider/provider.dart';
import '../../controller/helpers/news_helper.dart';
import '../../controller/providers/connection_provider.dart';
import '../../controller/providers/news_provider.dart';
import '../../controller/providers/theme_provider.dart';
import '../component/no_internet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Provider.of<ConnectionProvide>(context, listen: false).initialize();
    return WillPopScope(
      onWillPop: () async {
        return await Get.dialog(
          AlertDialog(
            title: const Text("Close this app ?"),
            content: const Text(
              "Are you sure want to exit?",
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Close"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            (Provider.of<NewsProvider>(context).index == 0)
                ? "News"
                : "Categories",
          ),
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .chnageTheme();
              },
              icon: Icon(
                (Provider.of<ThemeProvider>(context).tm1.isDark)
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<NewsProvider>(context, listen: false).clearSearchList();
            Navigator.of(context).pushNamed("search_page");
          },
          child: const Icon(Icons.search),
        ),
        body: PageView(
          onPageChanged: (index) {
            Provider.of<NewsProvider>(context, listen: false)
                .changeIndex(i: index);
          },
          controller: pageController,
          children: [
            (Provider.of<ConnectionProvide>(context).isOffline)
                ? noInternet(context: context)
                : futureBuilder(
                    future: NewsHelper.newsHelper.getHeadLineNews()),
            const CategoryPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
              tooltip: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              activeIcon: Icon(Icons.category),
              label: "Category",
              tooltip: "Category",
            ),
          ],
          currentIndex: Provider.of<NewsProvider>(context).index,
          onTap: (index) {
            Provider.of<NewsProvider>(context, listen: false)
                .changeIndex(i: index);
            pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
