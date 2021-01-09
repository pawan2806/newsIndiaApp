import 'package:flutter/material.dart';
import 'package:newsindia/model/articleModel.dart';
import 'package:newsindia/pages/articlePage.dart';
import 'package:newsindia/src/remoteNews.dart';
import 'package:newsindia/model/widgetsConst.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  CategoryNews({@required this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState(category);
}

class _CategoryNewsState extends State<CategoryNews> {
  final String category;

  _CategoryNewsState(this.category);


  List<ArticleModel> articles = List<ArticleModel>();
  bool _isLoading = true;

  void getCategorynews() async {
    CategoryNewsNow news = CategoryNewsNow();
    await news.getCategoryNews(widget.category);
    articles = news.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    getCategorynews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _isLoading
          ? Container(
        child: Center(child: CircularProgressIndicator()),
      )
          : SingleChildScrollView(
        child: Padding(
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

                  category,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 15),
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
      ),
    );
  }
}
