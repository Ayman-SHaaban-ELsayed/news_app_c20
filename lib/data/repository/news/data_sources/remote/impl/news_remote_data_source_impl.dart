//Note impl => news remote ds
import 'package:news_app_c20/api/api_manager.dart';
 import 'package:news_app_c20/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app_c20/api/model/news/news_response.dart';

//Note:http:
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    return apiManager.getNewsBySourceId(sourceId);
  }
}
