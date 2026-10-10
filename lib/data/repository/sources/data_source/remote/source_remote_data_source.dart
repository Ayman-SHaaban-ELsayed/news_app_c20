//Note: interface => source remote dataSource (ds)
import 'package:news_app_c20/api/model/sources/source_response.dart';

abstract class SourceRemoteDataSource {
Future<SourceResponse>  getSources(String categoryId);
}