import 'package:clean_demo/core/resources/data_state.dart';
import 'package:clean_demo/features/home/domain/entity/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}