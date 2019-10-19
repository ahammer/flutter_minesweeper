import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mine_sweeper/src/scaffolding/mine_redux.dart';
import 'package:mine_sweeper/src/state/app_state.dart';
import 'package:mine_sweeper/src/ui/screens/game_screen.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class MinesweeperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store =
        Store<AppState>(minesweepReducer, initialState: AppState.getDefault());

    return Provider.value(
        value: store,
        child: StoreProvider(
            store: store, child: MaterialApp(home: GameScreen())));
  }
}
