//Note: Interface == abstract => news remote data Source
import 'package:news_app_c20/api/model/news/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNewsBySourceId(String sourceId);

}
