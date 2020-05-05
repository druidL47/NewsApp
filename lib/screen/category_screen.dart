import 'package:flutter/material.dart';
// import 'package:news_app/widgets/category_widget.dart';
// import '../model/article_model.dart';
import '../data/article_data.dart';
import '../widgets/newsTile.dart';

class CategoryScreen extends StatefulWidget {
  final String newsCategory;
  CategoryScreen(this.newsCategory);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var newslist;
  bool loading = true;

  @override
  void initState() {
    getNews();

    super.initState();
  }

  void getNews() async {
    NewsSortByCategory news = NewsSortByCategory();
    await news.getNewsBy(widget.newsCategory);
    newslist = news.newsSortBy;
    setState(() {
      loading = false;
    });
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
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: EdgeInsets.only(top: 19),
              // height: 100,
              child: ListView.builder(
                  itemCount: newslist.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewsTile(
                      imgUrl: newslist[index].urlToImage ?? "",
                      title: newslist[index].title,
                      desc: newslist[index].description,
                      content: newslist[index].content,
                      posturl: newslist[index].articleUrl,
                    );
                  }),
            ),
    );
  }
}
