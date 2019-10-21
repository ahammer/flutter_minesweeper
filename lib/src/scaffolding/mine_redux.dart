import 'package:mine_sweeper/src/state/app_state.dart';

AppState minesweepReducer(AppState oldState, dynamic action) {
  if (action is Reducer) {
    return action.reducer(oldState);
  }
  return oldState;
}

abstract class Reducer {
  AppState Function(AppState oldState) get reducer;    
}