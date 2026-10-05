import 'package:flutter/widgets.dart';
import 'package:news_app_c20/api/api_manager.dart';
import 'package:news_app_c20/api/model/news/news.dart';

class SearchViewModel extends ChangeNotifier {
  List<News>? newsList;
  String? errorMessage;
  bool isLoading = false;
  int currentPage = 1;
  bool isFetchingMore = false;
  bool hasMoreData = true;

  void searchNews(String query, {bool isLoadMore = false}) async {
    if (query.isEmpty) {
      newsList = [];
      notifyListeners();
      return;
    }

    try {
      if (isLoadMore) {
        if (isFetchingMore || !hasMoreData) return;
        isFetchingMore = true;
        currentPage++;
        notifyListeners();
      } else {
        isLoading = true;
        currentPage = 1;
        hasMoreData = true;
        newsList = null;
        notifyListeners();
      }
      var response = await ApiManager.searchNews(
        query,
        page: currentPage,
        pageSize: 7,
      );

      if (response.status == 'error') {
        errorMessage = response.message!;
      } else {
        if (isLoadMore) {
          if (response.articles != null && response.articles!.isNotEmpty) {
            newsList!.addAll(response.articles!);
          } else {
            hasMoreData = false;
          }
        } else {
          newsList = response.articles;
        }
      }
    } catch (e) {
      errorMessage = e.toString();
      if (isLoadMore) currentPage--;
    }

    isLoading = false;
    isFetchingMore = false;
    notifyListeners();
  }
}