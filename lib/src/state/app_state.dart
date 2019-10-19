import 'package:built_value/built_value.dart';
import 'package:mine_sweeper/src/state/mine_sweeper.dart';

part 'app_state.g.dart';

//This will represent the App State
abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  //The current theme
  String get theme;

  //The current game board
  MineSweeper get mineSweeper;  
}