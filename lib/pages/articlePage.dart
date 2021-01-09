import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleNews extends StatefulWidget {
  final String imageUrl;

  const ArticleNews({Key key, this.imageUrl}) : super(key: key);
  @override
  _ArticleNewsState createState() => _ArticleNewsState();
}

class _ArticleNewsState extends State<ArticleNews> {
  final Completer<WebViewController> _completer =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Scaffold(

          body: Container(

            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: widget.imageUrl,
              onWebViewCreated: ((WebViewController webViewController) {
                _completer.complete(webViewController);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
