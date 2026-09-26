import 'package:flutter/material.dart';
import 'package:news_app_c20/l10n/app_localizations.dart';
import 'package:news_app_c20/ui/home/category_details/category_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home,
        style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: CategoryDetails(),
    );
  }
}
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=0d111f8f92154ebcaa4c62b58dfe4158
 */