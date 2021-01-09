import 'package:flutter/material.dart';
import 'package:newsindia/model/categoryModel.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:newsindia/pages/articlePage.dart';
import 'package:newsindia/pages/categoryPage.dart';
import 'package:newsindia/src/remoteData.dart';
import 'package:newsindia/src/remoteNews.dart';
import 'package:newsindia/model/articleModel.dart';

class CategoryTiles extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  CategoryTiles({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryNews(
            category: categoryName.toString(),
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                width: 120,
                height: 60,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                //margin: EdgeInsets.only(right: 16),

                  decoration: BoxDecoration(
                    //color: Colors.red,
                    color: Colors.black45,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(14),
                        right: Radius.circular(14)),
//
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Text(

                    categoryName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )),
            )

          ],
        ),

      ),
    );
  }
}


class NewsTitles extends StatelessWidget {
  final String imageUrl, title, desc, url;

  NewsTitles(
      {@required this.imageUrl,
        @required this.title,
        this.desc,
        @required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        //color: Colors.red,
        color: Colors.black,
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(14),
            right: Radius.circular(14)),
//
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl)),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            desc,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Color(0xFF04c5ba),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleNews(
                        imageUrl: url,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Read More",
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "JosefinSans",
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_sharp,
                          color: Colors.white,
                          size: 30.0,
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
