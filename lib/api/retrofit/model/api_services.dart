import 'package:dio/dio.dart';
import 'package:news_app_c20/api/model/api_end_points.dart';
import 'package:news_app_c20/api/retrofit/model/news_response_retrofit.dart';
import 'package:news_app_c20/api/retrofit/model/source_responsive_retrofit.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://newsapi.org')
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @GET(ApiEndPoints.sourceApi)
  Future<SourceResponsiveRetrofit> getSources(
    @Query('apiKey') String apiKey,
    @Query('category') String categoryId,
  );

  @GET(ApiEndPoints.newsApi)
  Future<NewsResponseRetrofit> getNewsBySourceId(
    @Query('apiKey') String apiKey,
    @Query('sources') String sourceId,
  );
}
