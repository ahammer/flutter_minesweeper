import 'package:built_value/built_value.dart';
import 'package:mine_sweeper/src/state/mine_sweeper.dart';

part 'app_state.g.dart';

//This will represent the App State
abstract class AppState implements Built<AppState, AppStateBuilder> {
  

  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  //Get the default, no-args App State
  factory AppState.getDefault() => AppState((b) => b
    ..theme = "Light"
    ..difficulty = "easy");

  //The current theme
  String get theme;

  //The current game board
  @nullable
  MineSweeper get mineSweeper;

  String get difficulty;  
}
