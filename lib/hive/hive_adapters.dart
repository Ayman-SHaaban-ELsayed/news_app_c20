import 'package:hive_ce/hive_ce.dart';
import 'package:news_app_c20/api/model/sources/source_response.dart';
import 'package:news_app_c20/api/model/sources/sources.dart';

@GenerateAdapters([AdapterSpec<SourceResponse>(),AdapterSpec<Sources>()])
part 'hive_adapters.g.dart';
//ونرن الكود بعد منكتب الكلاس todo
//Todo: flutter packages pub run build_runner build  --delete-conflicting-outputs
//فالاخر الايرور هيختفى و3 ملفات اللى فيها حرف الجى هتتعمل اوتوماتيك نروح كاتبين فالمين:
//  WidgetsFlutterBinding.ensureInitialized();
//  await Hive.initFlutter();
// Hive..init('.')..registerAdapters();
/*Note:
    خطوات الهايف:
    1-  اضافة المكتبات:
    hive_ce: ^2.20.2
      hive_ce_flutter: ^2.4.0
      //path_provider: ^2.1.6 بدل اللى قبلها لو عايز احدد المكان
      2-اضافة للديف ديبندنسى:
      hive_ce_generator: ^1.11.3
      build_runner: ^2.16.2
      3-create:
      Box, put(key, value),close
      4-open:
      Box ,get(key)
      5-in main :
      void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Hive.initFlutter(); //import 'package:hive_ce_flutter/hive_ce_flutter.dart';
      //or path provider
      Hive..init('.')..registerAdapters();//دى للادابترز
      6-ِAdapter: دة يخصة مكتبات الديف:build_runnerوhive_ce_generator
    lib => hive => hive_adapters:
    import 'package:hive_ce/hive_ce.dart';
    import 'package:news_app_c20/api/model/sources/source_response.dart';
    import 'package:news_app_c20/api/model/sources/sources.dart';

    @GenerateAdapters([AdapterSpec<SourceResponse>(),AdapterSpec<Sources>()])
    part 'hive_adapters.g.dart';
    //ونرن الكود بعد منكتب الكلاس todo
    //Todo: flutter packages pub run build_runner build  --delete-conflicting-outputs
 */