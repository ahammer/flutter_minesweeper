import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mine_sweeper/src/state/actions/minesweeper_actions.dart';
import 'package:mine_sweeper/src/state/app_state.dart';
import 'package:mine_sweeper/src/state/mine_sweeper.dart';
import 'package:mine_sweeper/src/state/mine_sweeper_node.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

const kBoardEdgePadding = 8.0;

class GameBoard extends StatelessWidget {
  const GameBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
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
            Container(color: Colors.red, width: 128, height: 48),
            Expanded(child: Container()),
            Center(
                child: FlatButton(
              color: Colors.green,
              child: Text("😀"),
              onPressed: () {
                Provider.of<Store<AppState>>(context)
                    .dispatch(NewGameAction(MineSweeper.newGame()));
              },
            )),
            Expanded(child: Container()),
            Container(color: Colors.blue, width: 127, height: 48),
          ],
        ),
      ),
    );
  }
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
                  appState.state.mineSweeper.height),
              distinct: true,
              builder: (ctx, vm) {
                List<Widget> children = List();
                for (int x = 0; x < vm.width; x++) {
                  for (int y = 0; y < vm.height; y++) {
                    children.add(MineBlock(x: x, y: y));
                  }
                }

                return Container(
                    color: Colors.black45,
                    width: double.infinity,
                    height: double.infinity,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: vm.width,
                      children: children,
                      childAspectRatio:
                          constraints.maxWidth / constraints.maxHeight,
                    ));
              }));
}

class MineFieldViewModel {
  final int width;
  final int height;

  MineFieldViewModel(this.width, this.height);

  //Equals and Hashcode
  bool operator ==(o) =>
      o is MineFieldViewModel && o.width == width && o.height == height;

  @override
  int get hashCode => (width + height).hashCode;
}

class MineBlock extends StatefulWidget {
  final int x, y;

  const MineBlock({Key key, this.x, this.y}) : super(key: key);

  @override
  _MineBlockState createState() => _MineBlockState();
}

class _MineBlockState extends State<MineBlock> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: StoreConnector<AppState, MineSweeperNode>(
          converter: (state) => state.state.mineSweeper.getNode(x: widget.x, y: widget.y),
          distinct: true,
          builder: (context, vm) => GestureDetector(
            onTap: () {
              Provider.of<Store<AppState>>(context)
                  .dispatch(TouchMineSweeperTileAction(x: widget.x, y: widget.y));
            },
            onLongPress: () {
              Provider.of<Store<AppState>>(context)
                  .dispatch(FlagMineSweeperTileAction(x: widget.x, y: widget.y));
            },
            child: MouseRegion(
              onEnter: (_)=> setState(() => hover = true),
              onExit: (_)=> setState(() => hover = false),
                          child: AnimatedContainer(
                color: vm.isVisible
                    ? (vm.isBomb ? Colors.red : Colors.transparent)
                    : hover?Colors.blueGrey:Colors.grey,
                duration: Duration(milliseconds: 66),
                child: Center(
                    child: Text(vm.isVisible
                        ? (vm.isBomb ?? false)
                            ? "💣"
                            : "${vm.neighbours == 0 ? "" : vm.neighbours}"
                        : (vm.isTagged?"🏳":"❓"))),
              ),
            ),
          ),
        ));
  }
}
