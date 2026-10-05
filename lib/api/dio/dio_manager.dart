/// LinkToLibraries
// todo
// https://pub.dev/packages/dio/install
// https://pub.dev/packages/dio
// https://pub.dev/packages/pretty_dio_logger
//https://medium.com/@bouargalne.hamid/mastering-dio-interceptors-in-flutter-a-complete-guide-with-authinterceptor-0543bcb1f263
//
import 'package:dio/dio.dart';
import 'package:news_app_c20/api/dio/dio_interceptor.dart';
import 'package:news_app_c20/api/model/api_constants.dart';
import 'package:news_app_c20/api/model/api_end_points.dart';
import 'package:news_app_c20/api/model/news/News_response.dart';
import 'package:news_app_c20/api/model/sources/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//todo:  الطريقة الاحدث MVVM فى ملف SourceViewModel
//todo: لاما ننقل المحتوى لاما ننادى عليه
class DioManager {
  static final Dio dio =
      Dio(
          BaseOptions(
            //BaseOptions:
            // لو فيه اكتر من api مشتركين في نفس الحاجة نستخدم BaseOptions
            baseUrl: 'https://newsapi.org',
            // queryParameters: {'apiKey': ApiConstants.apiKey},///>>todo حالة الاضافة بالباراميترز
            //اختبارى حسب الحالة اللى بهندلها
            connectTimeout: Duration(seconds: 20),
            receiveTimeout: Duration(seconds: 20),
            headers: {
              // todo        انظر بديل ايضا فى @DioManager   ===>  onRequest :options.headers.addAll

              'X-Api-Key': ApiConstants.apiKey,
              //todo   حالة الاضافة headers
            },
          ),
        )
        // ..interceptors.add(LogInterceptor(responseBody: true,requestBody: true));
        ..interceptors.add(DioInterceptor())
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ),
        );

  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=key
   */
  static Future<SourceResponse> getSources(String categoryId) async {
    //             //todo     debug ways
    //   debugPrint("debugPrint loglog");
    //   // بديل Log.i
    //   developer.log('loglog هذه رسالة معلوماتية', name: 'Info', level: 800);
    // // بديل Log.e
    //     developer.log('هذه رسالة خطأ', name: 'Error', level: 1000);

    try {
      var response = await dio.get(
        ApiEndPoints.sourceApi,
        queryParameters: {'category': categoryId},
      );
      //todo without BaseOptions
      // var response = await dio.get(
      //   "https://newsapi.org/v2/top-headlines/sources",
      //   queryParameters: {
      //     'apiKey': ApiConstants.apiKey,
      //     'category': categoryId,
      //   },
      // );
      return SourceResponse.fromJson(response.data);
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw Exception("Timeout occurred while sending or receiving");
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          if (statusCode != null) {
            switch (statusCode) {
              case 400:
                throw Exception("Bad Request");
              case 401:
              case 403:
                throw Exception("Unauthorized");
              case 404:
                throw Exception("Not Found");
              case 409:
                throw Exception('Conflict');
              case 500:
                throw Exception("Internal Server Error");
            }
          }
          break;
        case DioExceptionType.cancel:
          break;
        case DioExceptionType.unknown:
          throw Exception("No Internet Connection");
        case DioExceptionType.badCertificate:
          throw Exception("Internal Server Error");
        case DioExceptionType.connectionError:
          throw Exception("Connection Error");
        default:
          throw Exception("Unknown Error");
      }
      throw Exception("Unknown Error");
    } catch (e) {
      rethrow;
    }
  }

  /*
    GET https://newsapi.org/v2/everything?q=bitcoin&apiKey=key

   */
  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try {
      var response = await dio.get(
        ApiEndPoints.newsApi,
        queryParameters: {'sources': sourceId},
      );
      //todo without BaseOptions
      // var response = await dio.get(
      //   "https://newsapi.org/v2/everything",
      //   queryParameters: {'apiKey': ApiConstants.apiKey, 'sources': sourceId},
      // );
      return NewsResponse.fromJson(response.data);
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw Exception("Timeout occurred while sending or receiving");
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          if (statusCode != null) {
            switch (statusCode) {
              case 400:
                throw Exception("Bad Request");
              case 401:
              case 403:
                throw Exception("Unauthorized");
              case 404:
                throw Exception("Not Found");
              case 409:
                throw Exception('Conflict');
              case 500:
                throw Exception("Internal Server Error");
            }
          }
          break;
        case DioExceptionType.cancel:
          break;
        case DioExceptionType.unknown:
          throw Exception("No Internet Connection");
        case DioExceptionType.badCertificate:
          throw Exception("Internal Server Error");
        case DioExceptionType.connectionError:
          throw Exception("Connection Error");
        default:
          throw Exception("Unknown Error");
      }
      throw Exception("Unknown Error");
    } catch (e) {
      rethrow;
    }
  }
}
