//note: local ds => interface
import 'package:news_app_c20/api/model/sources/source_response.dart';

abstract class SourceLocalDataSource {
  Future<SourceResponse> getSources(String categoryId);

  void saveSources(SourceResponse sourceResponse,String categoryId);
}
