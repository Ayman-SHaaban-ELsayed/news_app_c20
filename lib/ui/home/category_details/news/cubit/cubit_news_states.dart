//note: news states
import 'package:news_app_c20/api/model/news/news.dart';

abstract class CubitNewsStates {}

class NewsInitialState extends CubitNewsStates {} //note:==>pointer from parent هيشاور على object from class

class NewsLoadingState extends CubitNewsStates {}

class NewsErrorState extends CubitNewsStates {
  String errorMessage;

  NewsErrorState({required this.errorMessage});
}

class NewsSuccessState extends CubitNewsStates {
  List<News> newsList;

  NewsSuccessState({required this.newsList});
}
