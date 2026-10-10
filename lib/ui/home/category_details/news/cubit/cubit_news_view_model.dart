//Note: news view model:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c20/api/api_manager.dart';
import 'package:news_app_c20/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
import 'package:news_app_c20/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app_c20/data/repository/news/repository/impl/news_repository_impl.dart';
import 'package:news_app_c20/data/repository/news/repository/news_repository_contract.dart';
import 'package:news_app_c20/ui/home/category_details/news/cubit/cubit_news_states.dart';

class CubitNewsViewModel extends Cubit<CubitNewsStates> {
  late NewsRepositoryContract newsRepositoryContract;


  CubitNewsViewModel({required this. newsRepositoryContract}) : super(NewsLoadingState());
  //Note:or
  // CubitNewsViewModel() : super(NewsLoadingState()) {
  //   apiManager = ApiManager();
  //   newsRemoteDataSource = NewsRemoteDataSourceImpl(apiManager: apiManager);
  //   newsRepositoryContract = NewsRepositoryImpl(newsRemoteDataSource);
  // }

  //NOTE ViewModel ==>hold data && handle logic
  /*
NOTE:
  CubitNewsStates الداتا ممكن اسيبها هنا او احطها فال
  لكن لو سيبناها هنا لازم احط القيمة فمتغير قبل الemit عشان القيمة تبقى موجودة وهيبقى شكلها كدة
    emit(NewsErrorState());
     emit(NewsErrorState())...........
 */

  //note: handling logic
  void getNewsBySourceId(String sourceId) async {
    try {
      //Note: Loading
      emit(NewsLoadingState());
      var response = await newsRepositoryContract.getNewsBySourceId(sourceId);
      if (response.status == 'error') {
        emit(NewsErrorState(errorMessage: response.message!));
      }
      if (response.status == 'ok') {
        //Note success
        emit(NewsSuccessState(newsList: response.articles ?? []));
      }
    } catch (e) {
      //Note:error
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
