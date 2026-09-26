import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c20/api/model/sources/source_response.dart';

import 'package:news_app_c20/api/model/api_constants.dart';
import 'package:news_app_c20/api/model/api_end_points.dart';

class ApiManager {
  static Future<SourceResponse> getSources() async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.sourceApi, {
        'apiKey': ApiConstants.apiKey,
      });
      var response = await http.get(url);
      if (response.statusCode == 401) {

      }
      var responseBody = response.body;
      //String => json
      var json = jsonDecode(responseBody);
      //json => object
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
