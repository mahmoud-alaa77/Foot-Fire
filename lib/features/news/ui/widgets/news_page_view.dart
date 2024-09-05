import 'package:flutter/material.dart';
import 'package:foot_fire/features/news/data/repo/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPageView extends StatefulWidget {
  final Article article;
  const NewsPageView({super.key, required this.article});

  @override
  State<NewsPageView> createState() => _NewsPageViewState();
}

late WebViewController _controller;

class _NewsPageViewState extends State<NewsPageView> {
  @override
  initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.article.url ?? ""),
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.article.title.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: WebViewWidget(
          layoutDirection: TextDirection.ltr,
          controller: _controller,
        ),
      ),
    );
  }
}
