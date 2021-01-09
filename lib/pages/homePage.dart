import 'package:flutter/material.dart';
import 'package:newsindia/model/categoryModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsindia/model/widgetsConst.dart';
import 'package:newsindia/pages/articlePage.dart';
import 'package:newsindia/pages/categoryPage.dart';
import 'package:newsindia/src/remoteNews.dart';
import 'package:newsindia/src/remoteData.dart';
import 'package:newsindia/model/articleModel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>();
  List<ArticleModel> articles = List<ArticleModel>();

  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getnews();
    categories = getCategories();

  }

  void getnews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f8),
      body: _isloading
          ? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ))
          : SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // !Category
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff333333),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0))),
              height:260 ,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              //SizedBox(width: 10),
                              Text("News India",
                                  style: new TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "JosefinSans",
                                  )),
                              SizedBox(width: 170,),
                              Image.asset(
                                "assets/images/menu.png",
                                width: 25,
                              )
                            ],
                          ),

                        ],
                      )),
                  SizedBox(height: 10),
                  Container(
                    height: 130,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) => CategoryTiles(
                          imageUrl: categories[index].imageUrl,
                          categoryName: categories[index].categoryName,
                        )),
                  ),
                  //SizedBox(height: 20.0,),

                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: [
                  SizedBox(height: 10,),

                  Container(
                    //margin: EdgeInsets.only(right: 16),

                    decoration: BoxDecoration(
                      //color: Colors.red,
                      color: Colors.black,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(14),
                          right: Radius.circular(14)),
//
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Text(

                      "Breaking News",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),

                  Container(
                    // padding: EdgeInsets.symmetric(vertical: 15),
                    // height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: (context, index) => NewsTitles(
                        imageUrl: articles[index].urlToImage ?? "",
                        title: articles[index].title ?? "",
                        desc: articles[index].desc ?? "",
                        url: articles[index].url ?? "",

                      ),
                    ),
                  ),



                ],
              ),
            ),

          ],

        ),
      ),



    );
  }
}

