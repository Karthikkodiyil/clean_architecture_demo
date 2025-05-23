

import 'package:clean_demo/core/constants/constants.dart';
import 'package:clean_demo/features/home/data/model/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';


@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;
  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,    
    @Query("country") String? country,  
    @Query("category") String? category, 
   

  });
}