https://medium.com/@aly.route
link to demo video assignment:
evently:
edit
, delete event
event details screen
users shared preferences
1- https://drive.google.com/file/d/1P4IwkGHxrYIbF9N4kUswdT9JSzJF4WMm/view?usp=sharing
2- https://drive.google.com/file/d/1EyYQ0b0kcnYT8bsQwMrC68IgRMlYsrAj/view?usp=sharing
Shimmer:
https://pub.dev/packages/shimmer

Dependency injection:
https://medium.com/@inzuael/solid-dependency-inversion-principle-part-5-f5bec43ab22e

Top Flutter Network Connectivity Status packages:
https://fluttergems.dev/network-connectivity-status/
https://pub.dev/packages/connectivity_plus

DatabaseHive:
https://pub.dev/packages/hive
https://pub.dev/packages/hive_flutter
https://pub.dev/packages/hive_generator
DatabaseHiveCe:
https://pub.dev/packages/hive_ce =>https://docs.hive.isar.community/
https://pub.dev/packages/hive_ce_flutter
https://pub.dev/packages/path_provider & add in main
https://pub.dev/packages/hive_ce_generator
https://docs.hive.isar.community/#/custom-objects/type_adapters :
0-https://docs.hive.isar.community/#/home?id=add-to-project
1-Create adapter auto
https://docs.hive.isar.community/#/custom-objects/generate_adapters
Create adapter manually:
2- https://docs.hive.isar.community/#/custom-objects/create_adapter_manually
قديما:
https://www.geeksforgeeks.org/flutter/flutter-create-typeadapters-in-hive/
==================================================
l10n Localization:
# console:
# flutter pub add flutter_localizations:"{sdk: flutter}" intl:any
#flutter gen-l10n
#  flutter run
#  flutter pub get
#####dont forget to add generate below the last flutter title
#flutter:
#
#  # The following line ensures that the Material Icons font is
#  # included with your application, so that you can use the icons in
#  # the material Icons class.
#  uses-material-design: true
#  generate: true   <<<<<=======
==================================================
# news_app_c20

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
/*
# Note:
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
    /////////////////////////////////////////////
  
      <<====================خطوات ال  singeleton  <<==========
    class ApiManager {
    ApiManager._();//private constructor
    static ApiManager? _instance;
    static ApiManager getInstance(){
    _instance??=ApiManager._(); //if _instance null assign ApiManager._() to it.
    return _instance!;
    }
        وننادى عليه:
    ApiManager.getInstance()
    /////////////////////////////////////////////
    <<====================خطوات ال  injectable  <<==========
    https://pub.dev/packages/injectable
    https://pub.dev/packages/get_it
    
    install:
    dependencies:
      injectable: ^3.0.0
      get_it: ^9.3.0
    
    dev_dependencies:
      injectable_generator: ^3.1.3
      build_runner: ^2.16.1 

    Setup
        1-Create a new dart file and define a global var for your GetIt instance.
        2-Define a top-level function (lets call it configureDependencies) then annotate it with @injectableInit.
        3-Import the Generated dart file created later on in the code. This will follow the name of the file with the @InjectableInit annotated func, eg file_name.config.dart.
        4-Call the Generated extension func getIt.init(), or your custom initializer name inside your configure func.
    //Note: بديل للdi هنمسحة
    //هنستبدل ال
    // <FILE_NAME>
    //باسم الملف الحالى
    import 'package:get_it/get_it.dart';
    import 'package:injectable/injectable.dart';
    import '<FILE_NAME>.config.dart';
    
    final getIt = GetIt.instance;

    @InjectableInit(  
    initializerName: 'init', // default  
    preferRelativeImports: true, // default  
    asExtension: true, // default  
    )  
    void configureDependencies() => getIt.init();
        //in main:
    void main() {  
    configureDependencies();  
    runApp(MyApp());  
    }  
    >>>> then Run the generator:
    #Use the [watch] flag to watch the files' system for edits and rebuild as necessary:
    
        flutter packages pub run build_runner watch

    #if you want the generator to run one time and exits use:
    
        flutter packages pub run build_runner build  
    #note:
    >>>>@singleton : زى فالapiManaget
    بيتكريت اول مبنفتح البرنامج ويتقفل اول منقفل البرنامج
    بينما:
    >>>>@lazySingleton:
    بيتكريت اول مبنادى عليه وبيتعملوا kill أول منقفل البرنامج
    >>>>@factory
    بيتكريت اول مبنادى عليه وبيتعملوا kill أول منقفل الاسكرين الموجود فيها
    >>>>@Injectable(as:NewsRepositoryContract)
     فوق ال implementation للabstact بتاعها
    >>>>CubitNewsViewModel cubitNewsViewModel =getIt<CubitNewsViewModel>;
    بديلة ل:
     CubitNewsViewModel cubitNewsViewModel = CubitNewsViewModel(newsRepositoryContract: injectNewsRepository());


