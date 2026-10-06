import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c20/api/api_manager.dart';
import 'package:news_app_c20/ui/home/category_details/sources/cubit/cubit_source_states.dart';

//NOTE: cubit==>  source view model
class CubitSourceViewModel extends Cubit<CubitSourceStates> {
  CubitSourceViewModel() : super(SourceLoadingState()); //اول ميفتح عاللودنج
  //NOTE ViewModel ==>hold data && handle logic
  /*
NOTE:
  CubitSourceStates الداتا ممكن اسيبها هنا او احطها فال
  لكن لو سيبناها هنا لازم احط القيمة فمتغير قبل الemit عشان القيمة تبقى موجودة وهيبقى شكلها كدة
    emit(SourceErrorState());
     emit(SourceErrorState())...........
 */

  //note: handling logic
  void getSources(String categoryId) async {
    try {
      //todo:loading
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
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
