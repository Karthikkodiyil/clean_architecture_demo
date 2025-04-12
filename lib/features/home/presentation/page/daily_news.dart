import 'package:clean_demo/features/home/presentation/widget/news_widget.dart';
import 'package:flutter/material.dart';

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


