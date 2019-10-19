import 'package:mine_sweeper/src/state/app_state.dart';

AppState minesweepReducer(AppState oldState, dynamic action) {
  if (action is Reducer) {
    return action.reduce(oldState);
  }
  return oldState;
}

abstract class Reducer {
  AppState Function(AppState oldState) get reducer;  
  AppState reduce(AppState oldState)  => reducer(oldState);
}