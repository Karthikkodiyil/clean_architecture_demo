import 'dart:developer';

import 'package:clean_demo/features/home/domain/entity/article.dart';
import 'package:clean_demo/features/home/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_demo/features/home/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily News"),
      ),
      body: const NewsWidget(),
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is RemoteArticlesError) {
        return Center(
          child: IconButton(
              iconSize: 25, onPressed: () {}, icon: const Icon(Icons.refresh)),
        );
      }
      if (state is RemoteArticlesDone) {
        List<ArticleEntity> article = state.articles!;
        log(article.toString(),name: "ui");
        return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return Text("${article[index].content}");
            });
      }
      return const SizedBox();
    });
  }
}
