import 'package:clean_demo/features/home/domain/entity/article.dart';
import 'package:flutter/material.dart';

class NewsDescPage extends StatelessWidget {
  final ArticleEntity article;
  const NewsDescPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: Text(
          article.source!.name ?? "",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: size.width * 0.95,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Container(
                    width: size.width * 0.95,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(article.urlToImage ?? ""),
                            fit: BoxFit.fill)),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: TextWidget(
                      text: article.publishedAt ?? "",
                      style:
                          const TextStyle(fontFamily: "poppins", fontSize: 12),
                    )),
                TextWidget(
                  text: article.title ?? "",
                  style: const TextStyle(fontFamily: "poppins", fontSize: 21),
                ),
                TextWidget(
                  text: article.content ?? "",
                  style: const TextStyle(fontFamily: "poppins", fontSize: 17),
                ),
                TextWidget(
                  text: article.description ?? "",
                  style: const TextStyle(fontFamily: "poppins", fontSize: 17),
                ),
                SizedBox(
                  width: size.width * 0.75,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextWidget(
                        text: "- ${article.author ?? "Author"}",
                        style: const TextStyle(
                            fontFamily: "poppins", fontSize: 15),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    required this.style,
  });

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
