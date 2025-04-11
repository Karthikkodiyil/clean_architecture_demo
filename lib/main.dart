import 'package:clean_demo/config/theme/app_theme.dart';
import 'package:clean_demo/features/home/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_demo/features/home/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_demo/features/home/presentation/page/daily_news.dart';
import 'package:clean_demo/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
