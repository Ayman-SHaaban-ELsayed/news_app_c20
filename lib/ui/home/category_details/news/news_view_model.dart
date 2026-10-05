import 'package:flutter/widgets.dart';
import 'package:news_app_c20/api/api_manager.dart';
import 'package:news_app_c20/api/model/news/news.dart';

class NewsViewModel extends ChangeNotifier {
  List<News>? newsList;
  String? errorMessage;
  bool isLoading = false;

  void egtNewsBySourceID(String sourceId) async {
    //todo هناخدة نسخ من ال
    // apiManager
    //او ننادى علية
    try {
      //todo: loading
      isLoading = true;
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response.status == 'error') {
        //todo :error =>server
        errorMessage = response.message!;
      } else {
        //todo success
        newsList = response.articles;
      }
    } catch (e) {
      //todo error client side
      errorMessage=e.toString();
    }
    isLoading=false;
    notifyListeners();
  }
}
