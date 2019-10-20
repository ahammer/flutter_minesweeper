import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mine_sweeper/src/state/actions/minesweeper_actions.dart';
import 'package:mine_sweeper/src/state/app_state.dart';
import 'package:mine_sweeper/src/state/mine_sweeper.dart';
import 'package:mine_sweeper/src/ui/components/mine_block.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

const kBoardEdgePadding = 2.0;

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
    return Card(
      child: Row(
        children: <Widget>[
          const Expanded(
            child: const Center(child: const BombsRemaining()),
          ),
          Expanded(child: Container()),
          Center(
              child: FlatButton(
                child: Text(
                  "😀",
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  Provider.of<Store<AppState>>(context)
                      .dispatch(NewGameAction(MineSweeper.newGame()));
                },
              )),
          Expanded(child: Container()),
          const Expanded(
            child: const Center(child: const GameTimer()),
          ),
        ],
      ),
    );
  }
}

class GameTimer extends StatelessWidget {
  const GameTimer();

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, String>(
      converter: (store) {
        if (store.state.mineSweeper == null) return "";
        return "${(store.state.mineSweeper.gameOverTime ?? DateTime.now()).difference(store.state.mineSweeper.startTime).inSeconds}";
      },
      distinct: true,
      builder: (ctx, value) =>
          Text(value, style: Theme.of(context).textTheme.title));
}

class BombsRemaining extends StatelessWidget {
  const BombsRemaining();

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, String>(
      converter: (store) {
        if (store.state.mineSweeper == null) return "";
        return "${(store.state.mineSweeper.bombs) - store.state.mineSweeper.flagCount}";
      },
      distinct: true,
      builder: (ctx, value) =>
          Text(value, style: Theme.of(context).textTheme.title));
}

class MineField extends StatelessWidget {
  const MineField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (context, constraints) =>
          StoreConnector<AppState, MineFieldViewModel>(
              converter: (store) {
                if (store.state.mineSweeper != null) {
                  return MineFieldViewModel(
                      width: store.state.mineSweeper.width,
                      height: store.state.mineSweeper.height,
                      gameOver: store.state.mineSweeper.isGameOver,
                      win: store.state.mineSweeper.isWin,
                      started: true);
                } else {
                  return MineFieldViewModel(
                      width: 0,
                      height: 0,
                      gameOver: true,
                      win: false,
                      started: false);
                }
              },
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
                    ...vm.started
                        ? [
                            GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: vm.width,
                              children: children,
                              childAspectRatio:
                                  constraints.maxWidth / constraints.maxHeight,
                            )
                          ]
                        : [],
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
                                  vm.started? vm.gameOver
                                      ? vm.win
                                          ? "🔥🔥 You Win 🔥🔥"
                                          : "💩💩 Game Over 💩💩"
                                      : "":"Flutter Minesweeper",
                                  style: Theme.of(context).textTheme.display1,
                                )))))
                  ],
                );
              }));
}

class MineFieldViewModel {
  final bool started;
  final int width;
  final int height;
  final bool gameOver;
  final bool win;

  MineFieldViewModel(
      {this.width, this.height, this.gameOver, this.win, this.started});

  //Equals and Hashcode
  bool operator ==(o) =>
      o is MineFieldViewModel &&
      o.width == width &&
      o.height == height &&
      o.gameOver == gameOver;

  @override
  int get hashCode => (width + height + (gameOver ? 1 : 0)).hashCode;
}
