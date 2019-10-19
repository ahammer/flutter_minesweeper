import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mine_sweeper/src/scaffolding/mine_redux.dart';
import 'package:mine_sweeper/src/ui/screens/game_screen.dart';
import 'package:redux/redux.dart';

class MinesweeperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreProvider(
      store: Store(minesweepReducer), child: MaterialApp(home: GameScreen()));
}
