//Note: local ds => impl
import 'package:hive_ce/hive.dart';
import 'package:news_app_c20/api/model/sources/source_response.dart';
import 'package:news_app_c20/data/repository/sources/data_source/local/source_local_data_source.dart';

class SourceLocalDataSourceImpl implements SourceLocalDataSource {
  @override
  Future<SourceResponse> getSources(String categoryId) async {
    //Note: open box
    var box = await Hive.openBox('Sources');
    //Note:get sources
    // var data = SourceResponse.fromJson( box.get('source_tab'), ); //return from map to object
    var data = box.get('source_tab');
    return data;
  }

  @override
  void saveSources(SourceResponse sourceResponse,String categoryId) async {
    // Note : openBox
    var box = await Hive.openBox('Sources');
    //Note:save sources:
    // await box.put(categoryId , sourceResponse.toJson()); //saved map
    await box.put(categoryId , sourceResponse );
    //Note:close box
    box.close();
  }
}
