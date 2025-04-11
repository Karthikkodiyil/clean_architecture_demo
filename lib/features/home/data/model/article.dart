import 'package:clean_demo/features/home/domain/entity/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

 factory ArticleModel.fromJson(Map<String, dynamic> json) {
 return ArticleModel(
 source : Source.fromJson(json['source']),
    author : json['author'],
    title : json['title'],
    description : json['description'],
    url : json['url'],
    urlToImage : json['urlToImage'],
    publishedAt : json['publishedAt'],
    content : json['content'],
 )  ;
  }
}

class Source extends SourceEntity{
 const Source({
   String? id,
  String? name
  });

 factory Source.fromJson(Map<String, dynamic> json) {
  return Source(
    id: json["id"]??"",
    name : json['name']??"",

  );
    
  }
}
