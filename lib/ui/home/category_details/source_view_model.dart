//todo viewmodel => statemanagement with Provider
import 'package:flutter/material.dart';
import 'package:news_app_c20/api/api_manager.dart';
import 'package:news_app_c20/api/model/sources/sources.dart';

class SourceViewModel extends ChangeNotifier {
  //todo usage:hold data  , handle logic
  List<Sources>? sourceList;
  String? errorMessage;
  bool isLoading = false;

  void getSources(String categoryId) async {
    //todo: method content to copy from: ApiManager Or DioManager وهنا البديل عنهم
    //todo: لاما ننقل المحتوى من هناك لهنا لاما ننادى عليه
//>>>>todo:reset values//reinitialize:
    sourceList=null;
    errorMessage=null;
    isLoading=false;
   notifyListeners();
         try {
      //todo: loading
      isLoading = true;
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        //todo server error
        errorMessage = response.message;
      } else {
        //todo success:
        sourceList = response.sources;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
notifyListeners();  }

}
