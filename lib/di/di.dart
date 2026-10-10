/*  dependency Injection (di)*/

/*Note
   sourceView                need object from   SourceViewModel
   SourceViewModel           need object from   SourceRepositoryContract
   SourceRepositoryContract  need object from   SourceRemoteDataSource
   SourceRemoteDataSource    need object from   ApiManager
 */
import 'package:news_app_c20/api/api_manager.dart';
import 'package:news_app_c20/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
import 'package:news_app_c20/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app_c20/data/repository/news/repository/impl/news_repository_impl.dart';
import 'package:news_app_c20/data/repository/news/repository/news_repository_contract.dart';
import 'package:news_app_c20/data/repository/sources/data_source/remote/impl/source_remote_data_source_impl.dart';
import 'package:news_app_c20/data/repository/sources/data_source/remote/source_remote_data_source.dart';
import 'package:news_app_c20/data/repository/sources/repository/imp/source_repository_impl.dart';
import 'package:news_app_c20/data/repository/sources/repository/source_repository_contract.dart';

SourceRepositoryContract injectSourceRepository() {
  return SourceRepositoryImpl(sourceRemoteDataSource: injectRemoteDataSource());
}

SourceRemoteDataSource injectRemoteDataSource() {
  return SourceRemoteDataSourceImpl(apiManager: injectApiManager());
}

ApiManager injectApiManager() {
  return ApiManager();
}

/*Note
   dependency Injection (di)
   newsView                need object from     newsViewModel
   newsViewModel           need object from    newsRepositoryContract
   newsRepositoryContract  need object from    newsRemoteDataSource
   newsRemoteDataSource    need object from   ApiManager
 */
NewsRepositoryContract injectNewsRepository() {
  return NewsRepositoryImpl(injectNewsRemoteDataSource());
}

NewsRemoteDataSource injectNewsRemoteDataSource() {
  return NewsRemoteDataSourceImpl(apiManager: ApiManager());
}
