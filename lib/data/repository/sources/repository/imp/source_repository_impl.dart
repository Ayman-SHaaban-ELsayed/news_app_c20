//Note: source repo implementation
import 'package:news_app_c20/api/model/sources/source_response.dart';
import 'package:news_app_c20/data/repository/sources/data_source/remote/source_remote_data_source.dart';
import 'package:news_app_c20/data/repository/sources/repository/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract {
  SourceRemoteDataSource sourceRemoteDataSource;

  SourceRepositoryImpl({required this.sourceRemoteDataSource});

  @override
  Future<SourceResponse> getSources(String categoryId) async {
    //Note: ممكن كدة
    //return sourceRemoteDataSource.getSources(categoryId);
    //or
    var sourceResponse = await sourceRemoteDataSource.getSources(categoryId);
    return sourceResponse;
  }
}
