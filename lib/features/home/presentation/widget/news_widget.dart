import 'package:clean_demo/features/home/domain/entity/article.dart';
import 'package:clean_demo/features/home/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_demo/features/home/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:clean_demo/features/home/presentation/page/news_desc_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: CircularProgressIndicator(
            strokeWidth: 3,
            backgroundColor: Colors.black,
            color: Colors.blue,
          ),
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
        return ArticleWidget(
          article: article,
          state: state,
        );
      }
      return const SizedBox();
    });
  }
}

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    super.key,
    required this.article,
    required this.state,
  });

  final List<ArticleEntity> article;
  final RemoteArticleState state;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
          itemCount: state.articles!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsDescPage(
                                article: article[index],
                              )));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: size.width * 0.3,
                      width: size.width * 0.3,
                      child: article[index].urlToImage == null
                          ? const Center(child: CircularProgressIndicator())
                          : Container(
                              height: size.width * 0.3,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          article[index].urlToImage ?? ""),
                                      fit: BoxFit.fill)),
                            ),
                    ),
                    SizedBox(
                        width: size.width * 0.65,
                        child: Column(
                          children: [
                            Text(article[index].title ?? ""),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                    "- ${article[index].author ?? "Author"}")),
                          ],
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
