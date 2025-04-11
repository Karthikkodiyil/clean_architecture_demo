import 'package:clean_demo/features/home/data/data_sources/news_api_service.dart';
import 'package:clean_demo/features/home/data/repository/article_repository_impl.dart';
import 'package:clean_demo/features/home/domain/repository/article_repository.dart';
import 'package:clean_demo/features/home/domain/usecases/get_article.dart';
import 'package:clean_demo/features/home/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

}
