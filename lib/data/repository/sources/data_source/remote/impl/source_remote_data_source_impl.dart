//Note: source remote data source =>impl
import 'package:news_app_c20/api/api_manager.dart';
import 'package:news_app_c20/api/model/sources/source_response.dart';
import 'package:news_app_c20/data/repository/sources/data_source/remote/source_remote_data_source.dart';

//Note: impl =>http
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager
  apiManager; //Note: يفضل نقل الكود هنا بس عشان هنستخدمة هناك فحاجة تانية
  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse> getSources(String categoryId) {
    return apiManager.getSources(categoryId);
  }
  //note: لو اتطلب منى احول الكود لدايو اعمل كلاس تانية هنا بتجيب دايو
}

//TODO: impl => dio
class SourceRemoteDataSourceDioImp implements SourceRemoteDataSource {
  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}

// TODO: impl => retrofit
class SourceRemoteDataSourceRetrofitImp implements SourceRemoteDataSource {
  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}
