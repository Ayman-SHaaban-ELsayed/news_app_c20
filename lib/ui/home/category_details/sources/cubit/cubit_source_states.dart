//NOTE ==>source states:
//note:  loading ,success , error , initial
import 'package:news_app_c20/api/model/sources/sources.dart';

abstract class CubitSourceStates {} //note: parent==>polymorphism

class SourceInitialState extends CubitSourceStates {} //note:==>pointer from parent هيشاور على object from class

class SourceLoadingState extends CubitSourceStates {}

class SourceErrorState extends CubitSourceStates {
  String? errorMessage;

  SourceErrorState({required this.errorMessage});
}

class SourceSuccessState extends CubitSourceStates {
  List<Sources>? sourcesList;

  SourceSuccessState({required this.sourcesList});
}
