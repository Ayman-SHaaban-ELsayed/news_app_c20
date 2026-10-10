//Note: interface => source repository
import 'package:news_app_c20/api/model/sources/source_response.dart';

abstract class SourceRepositoryContract {
  Future<SourceResponse> getSources(String categoryId);

}
