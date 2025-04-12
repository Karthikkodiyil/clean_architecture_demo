import 'dart:developer';
import 'dart:io';

import 'package:clean_demo/core/constants/constants.dart';
import 'package:clean_demo/core/resources/data_state.dart';
import 'package:clean_demo/features/home/data/data_sources/news_api_service.dart';
import 'package:clean_demo/features/home/data/model/article.dart';
import 'package:clean_demo/features/home/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsApiKey, country: countryQuery, category: categoryQuery);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            type: DioExceptionType.badResponse,
            response: httpResponse.response,
            error: httpResponse.response.statusCode));
      }
    } on DioException catch (e) {
      log(e.toString());
      return DataFailed(e);
    }
  }
}
