//Note : news repo => contract abstract == interface
 import 'package:news_app_c20/api/model/news/news_response.dart';

abstract class NewsRepositoryContract {
 Future<NewsResponse> getNewsBySourceId(String sourceId);

}