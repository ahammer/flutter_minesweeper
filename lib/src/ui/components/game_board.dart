import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mine_sweeper/src/state/actions/minesweeper_actions.dart';
import 'package:mine_sweeper/src/state/app_state.dart';
import 'package:mine_sweeper/src/state/mine_sweeper.dart';
import 'package:mine_sweeper/src/ui/components/mine_block.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

const kBoardEdgePadding = 8.0;

///
///The GameBoard consisting of the
///Top Area
/// - Mines - Flags
/// - Restart button
/// - Timer
///
///Mine Field
class GameBoard extends StatelessWidget {
  const GameBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(        
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  kBoardEdgePadding, kBoardEdgePadding, kBoardEdgePadding, 0),
              child: GameBoardHeader(),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(kBoardEdgePadding),
                child: MineField(),
              ),
            ))
          ],
        ));
  }
}

///
/// Header Section of the Gameboard
/// Has the Score, The Timer, and the Reset button
class GameBoardHeader extends StatelessWidget {
  const GameBoardHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Container(
              color: Colors.red,
              width: 128,
              height: 48,
              child: const Center(child: const BombsRemaining()),
            ),
            Expanded(child: Container()),
            Center(
                child: FlatButton(
              color: Colors.green,
              child: Text(
                "😀",
                textScaleFactor: 2.0,
              ),
              onPressed: () {
                Provider.of<Store<AppState>>(context)
                    .dispatch(NewGameAction(MineSweeper.newGame()));
              },
            )),
            Expanded(child: Container()),
            Container(
                color: Colors.blue,
                width: 127,
                height: 48,
                child: const Center(child: const GameTimer())),
          ],
        ),
      ),
    );
  }
}

class GameTimer extends StatelessWidget {
  const GameTimer();

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, String>(
      converter: (state) =>
          "${(state.state.mineSweeper.gameOverTime ?? DateTime.now()).difference(state.state.mineSweeper.startTime).inSeconds}",
      distinct: true,
      builder: (ctx, value) =>
          Text(value, style: Theme.of(context).textTheme.display1));
}

class BombsRemaining extends StatelessWidget {
  const BombsRemaining();

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, String>(
      converter: (store) =>
          "${store.state.mineSweeper.bombs - store.state.mineSweeper.flagCount}",
      distinct: true,
      builder: (ctx, value) =>
          Text(value, style: Theme.of(context).textTheme.display1));
}

class MineField extends StatelessWidget {
  const MineField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (context, constraints) =>
          StoreConnector<AppState, MineFieldViewModel>(
              converter: (appState) => MineFieldViewModel(
                  appState.state.mineSweeper.width,
                  appState.state.mineSweeper.height,
                  appState.state.mineSweeper.isGameOver,
                  appState.state.mineSweeper.isWin),
              distinct: true,
              builder: (ctx, vm) {
                List<Widget> children = List();
                for (int x = 0; x < vm.width; x++) {
                  for (int y = 0; y < vm.height; y++) {
                    children.add(MineBlock(x: x, y: y));
                  }
                }

                return Stack(
                  children: <Widget>[
                    GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: vm.width,
                      children: children,
                      childAspectRatio:
                          constraints.maxWidth / constraints.maxHeight,
                    ),
                    IgnorePointer(
                        child: AnimatedOpacity(
                            opacity: vm.gameOver ? 1 : 0,
                            duration: Duration(seconds: 1),
                            child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Theme.of(context)
                                    .colorScheme
                                    .surface
                                    .withOpacity(0.6),
                                child: Center(
                                    child: Text(
                                  vm.gameOver
                                      ? vm.win
                                          ? "🔥🔥 You Win 🔥🔥"
                                          : "💩💩 Game Over 💩💩"
                                      : "",
                                  style: Theme.of(context).textTheme.display1,
                                )))))
                  ],
                );
              }));
}

class MineFieldViewModel {
  final int width;
  final int height;
  final bool gameOver;
  final bool win;

  MineFieldViewModel(this.width, this.height, this.gameOver, this.win);

  //Equals and Hashcode
  bool operator ==(o) =>
      o is MineFieldViewModel &&
      o.width == width &&
      o.height == height &&
      o.gameOver == gameOver;

  @override
  int get hashCode => (width + height + (gameOver ? 1 : 0)).hashCode;
}
