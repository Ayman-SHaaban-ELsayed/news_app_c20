import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c20/api/model/api_constants.dart';
import 'package:news_app_c20/api/model/api_end_points.dart';
import 'package:news_app_c20/api/model/news/News_response.dart';
import 'package:news_app_c20/api/model/sources/source_response.dart';
//الطريقة الاحدث MVVM فى ملف SourceViewModel
//لاما ننقل المحتوى لاما ننادى عليه
class ApiManager {
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=key
   */

  static Future<SourceResponse> getSources(String categoryId) async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.sourceApi, {
        'apiKey': ApiConstants.apiKey,
        'category': categoryId,
      });
      var response = await http.get(url);
      if (response.statusCode == 401) {}
      var responseBody = response.body;
      //String => json
      var json = jsonDecode(responseBody);
      //json => object
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  /*
  GET https://newsapi.org/v2/everything?q=bitcoin&apiKey=key
   */
  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.newsApi, {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
      });
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);

      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
