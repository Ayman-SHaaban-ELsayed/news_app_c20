import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c20/api/dio/dio_manager.dart';
import 'package:news_app_c20/api/model/api_constants.dart';

class DioInterceptor extends Interceptor {
  // //TODO Start with IMPLEMENTS
  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  //   print('mySelfLogs onError:');
  //   print('mySelfLogs errorMessage: ${err.message}');
  //   print('///////////////////');
  //   print('mySelfLogs errorError: ${err.error}');
  //   handler.next(err);
  // }
  //
  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   // TODO: implement onRequest
  //   print('mySelfLogs onRequest:');
  //   print('mySelfLogs baseUrl: ${options.baseUrl}');
  //   handler.next(options);
  // }
  //
  // @override
  // void onResponse(
  //   Response<dynamic> response,
  //   ResponseInterceptorHandler handler,
  // ) {
  //   // TODO: implement onResponse
  //   print('mySelfLogs onResponse:');
  //   handler.next(response);
  // }
  //TODO end implements
////////////////////////////////////////////

  //TODO start WITH EXTENDS
  @override
    void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
      // TODO: implement onRequest
    debugPrint("onRequest: baseUrl: ${options.baseUrl}");
    options.headers.addAll(

      {
         //انظر ايضا فى @DioManager
        'X-Api-Key':ApiConstants.apiKey,//todo   حالة الاضافة headers

      }
    );
      super.onRequest(options, handler);
    }

  @override
    void onError(DioException err, ErrorInterceptorHandler handler) {
      //
    super.onError(err, handler);
    }

    @override
    void onResponse(Response response, ResponseInterceptorHandler handler) {
      //
      super.onResponse(response, handler);
    }
//TODO end WITH EXTENDS

}
