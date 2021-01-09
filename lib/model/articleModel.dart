class ArticleModel {
  String title;
  String desc;
  String url;
  String urlToImage;
  String content;
  String publishedAt;

  ArticleModel(
      {this.content,
        this.desc,
        this.title,
        this.url,
        this.urlToImage,
        this.publishedAt});
}
