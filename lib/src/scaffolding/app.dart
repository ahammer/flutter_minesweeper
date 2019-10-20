import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mine_sweeper/src/scaffolding/mine_redux.dart';
import 'package:mine_sweeper/src/state/actions/minesweeper_actions.dart';
import 'package:mine_sweeper/src/state/app_state.dart';
import 'package:mine_sweeper/src/ui/screens/game_screen.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

const kFillSpeed = 33;

class MinesweeperApp extends StatefulWidget {
  @override
  _MinesweeperAppState createState() => _MinesweeperAppState();
}

class _MinesweeperAppState extends State<MinesweeperApp> {
  final store =
      Store<AppState>(minesweepReducer, initialState: AppState.getDefault());
  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: kFillSpeed), (_) {
      store.dispatch(CleanBlanksAction());
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
        value: store,
        child: StoreProvider(
            store: store,
            child: StoreConnector<AppState, String>(
                converter: (store) => store.state.theme,
                distinct: true,
                builder: (context, value) => MaterialApp(
                      home: GameScreen(),
                      theme: (value == "Dark")
                          ? ThemeData.dark()
                          : ThemeData.light(),
                    ))));
  }
}
