import 'package:clean_demo/features/home/domain/entity/article.dart';
import 'package:flutter/material.dart';

class NewsDescPage extends StatelessWidget {
  final ArticleEntity article;
  const NewsDescPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: Text(article.source!.name ?? ""),
      ),
    );
  }
}
