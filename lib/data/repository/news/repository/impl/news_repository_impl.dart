//Note: news repository => impl
import 'package:injectable/injectable.dart';
import 'package:news_app_c20/api/api_manager.dart';
import 'package:news_app_c20/api/model/news/news_response.dart';
import 'package:news_app_c20/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app_c20/data/repository/news/repository/news_repository_contract.dart';
@Injectable(as:NewsRepositoryContract)
class NewsRepositoryImpl implements NewsRepositoryContract {
   late NewsRepositoryContract newsRepositoryContract;
      NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl(this.newsRemoteDataSource);

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    return newsRemoteDataSource.getNewsBySourceId(sourceId);
  }
}
