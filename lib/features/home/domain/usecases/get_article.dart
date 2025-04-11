import 'package:clean_demo/core/resources/data_state.dart';
import 'package:clean_demo/core/usecases/usecase.dart';
import 'package:clean_demo/features/home/domain/entity/article.dart';
import 'package:clean_demo/features/home/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements Usecase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}){
    return _articleRepository.getNewsArticles();
  }
}