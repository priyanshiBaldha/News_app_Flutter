import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/views/screens/details_page.dart';
import 'package:news_app/views/screens/home_page.dart';
import 'package:news_app/views/screens/search_page.dart';
import 'package:provider/provider.dart';

import 'controller/providers/connection_provider.dart';
import 'controller/providers/news_provider.dart';
import 'controller/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<NewsProvider>(
          create: (context) => NewsProvider(),
        ),
        ChangeNotifierProvider<ConnectionProvide>(
          create: (context) => ConnectionProvide(),
        ),
      ],
      builder: (context, _) => GetMaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(),
        themeMode: (Provider.of<ThemeProvider>(context).tm1.isDark == false) ? ThemeMode.light : ThemeMode.dark ,
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const HomePage(),
          "details_page": (context) => const DetailsPage(),
          "search_page": (context) => const SearchPage(),
        },
      ),
    );
  }
}
