import 'package:flutter/material.dart';
import '../model/category_model.dart';
import '../data/category_data.dart';
import '../widgets/category_widget.dart';
import '../data/article_data.dart';
import '../model/article_model.dart';
import '../widgets/newsTile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategorieModel> categories = new List<CategorieModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading;
  void getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'News',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'App',
                style: TextStyle(color: Colors.blue),
              )
            ],
          )),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                  child: Column(children: <Widget>[
                Container(
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Category(categories[index].categorieName,
                            categories[index].imageAssetUrl);
                      }),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 19),
                    // height: 100,
                    child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsTile(
                            imgUrl: articles[index].urlToImage ?? "",
                            title: articles[index].title,
                            desc: articles[index].description,
                            content: articles[index].content,
                            posturl: articles[index].articleUrl,
                          );
                        }),
                  ),
                )
              ])),
            ),
    );
  }
}
