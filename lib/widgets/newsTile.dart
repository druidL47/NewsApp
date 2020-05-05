import 'package:flutter/material.dart';
import '../screen/article_screen.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ArticleView.route, arguments: posturl);
      },
      child: Container(
          padding: EdgeInsets.all(12),
          alignment: Alignment.bottomCenter,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6)),
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    imgUrl,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 12,
              ),
              Text(title,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 4,
              ),
              Text(desc,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black54, fontSize: 14))
            ],
          )),
    );
  }
}
