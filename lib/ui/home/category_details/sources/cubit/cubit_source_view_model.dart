import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c20/api/api_manager.dart';
import 'package:news_app_c20/data/repository/sources/data_source/remote/impl/source_remote_data_source_impl.dart';
import 'package:news_app_c20/data/repository/sources/data_source/remote/source_remote_data_source.dart';
import 'package:news_app_c20/data/repository/sources/repository/imp/source_repository_impl.dart';
import 'package:news_app_c20/data/repository/sources/repository/source_repository_contract.dart';
import 'package:news_app_c20/ui/home/category_details/news/cubit/cubit_news_states.dart';
import 'package:news_app_c20/ui/home/category_details/sources/cubit/cubit_source_states.dart';

//NOTE: cubit==>  source view model
class CubitSourceViewModel extends Cubit<CubitSourceStates> {
    SourceRepositoryContract sourceRepositoryContract;

//اول ميفتح عاللودنج
CubitSourceViewModel({required this.sourceRepositoryContract}):super(SourceLoadingState());
//Note :أو
  // late SourceRemoteDataSource sourceRemoteDataSource;
  // late ApiManager apiManager;
  // CubitSourceViewModel() : super(SourceLoadingState()) {
  //   apiManager = ApiManager();
  //   sourceRemoteDataSource = SourceRemoteDataSourceImpl(apiManager: apiManager);
  //   sourceRepositoryContract = SourceRepositoryImpl(
  //     sourceRemoteDataSource: sourceRemoteDataSource,
  //   );
  // }


  //NOTE ViewModel ==>hold data && handle logic
  /*
NOTE:
  CubitSourceStates الداتا ممكن اسيبها هنا او احطها فال
  لكن لو سيبناها هنا لازم احط القيمة فمتغير قبل الemit عشان القيمة تبقى موجودة وهيبقى شكلها كدة
   var res =response.message;
     emit(SourceErrorState())...........
 */

  //note: handling logic
  void getSources(String categoryId) async {
    try {
      //todo:loading
      emit(SourceLoadingState());
      // var response = await ApiManager.getSources(categoryId);
      var response = await sourceRepositoryContract.getSources(categoryId);
      if (response.status == 'error') {
        //todo:error
        emit(SourceErrorState(errorMessage: response.message!));
      }
      if (response.status == 'ok') {
        //todo:success

        emit(SourceSuccessState(sourcesList: response.sources ?? []));
      }
    } catch (e) {
      //todo error
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
