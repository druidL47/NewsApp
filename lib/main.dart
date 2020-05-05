// import 'dart:js';

import 'package:flutter/material.dart';
import './screen/home_page.dart';
import './screen/article_screen.dart';
// import './screen/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        ArticleView.route: (context) => ArticleView(),
      },
    );
  }
}
