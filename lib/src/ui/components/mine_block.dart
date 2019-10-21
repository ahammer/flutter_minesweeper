import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mine_sweeper/src/state/actions/minesweeper_actions.dart';
import 'package:mine_sweeper/src/state/app_state.dart';
import 'package:mine_sweeper/src/state/mine_sweeper_node.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

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
    bool isGameOver = Provider.of<Store<AppState>>(context).state.mineSweeper.isGameOver;
    return LayoutId(
        id: "grid:${widget.x}:${widget.y}",
        child: StoreConnector<AppState, MineSweeperNode>(
          converter: (state) =>
              state.state.mineSweeper.getNode(x: widget.x, y: widget.y),
          distinct: true,
          builder: (context, vm) => GestureDetector(
            onTap: () {
              final store = Provider.of<Store<AppState>>(context);
              store.dispatch(
                  TouchMineSweeperTileAction(x: widget.x, y: widget.y));
                  store.dispatch(clearTiles);
            },
            onLongPress: () {
              Provider.of<Store<AppState>>(context).dispatch(
                  FlagMineSweeperTileAction(x: widget.x, y: widget.y));
            },
            child: MouseRegion(
              onEnter: (_) => setState(() {
                hover = !Provider.of<Store<AppState>>(context)
                    .state
                    .mineSweeper
                    .isGameOver;
              }),
              onExit: (_) => setState(() => hover = false),
              child: AnimatedContainer(
                decoration: vm.isVisible
                    ? (vm.isBomb ? bombBox(context) : cleanBox(context))
                    : hover
                        ? hoverBox(context)
                        : vm.isTagged ? flagBox(context) : unknownBox(context),
                duration: Duration(milliseconds: hover?(100*vm.random).toInt():(250+vm.random*500).toInt()),
                child: Center(
                    child: Text(vm.isVisible
                        ? (vm.isBomb ?? false)
                            ? "💣"
                            : "${vm.neighbours == 0 ? "" : vm.neighbours}"
                        : (vm.isTagged ? "🏳" : (isGameOver && vm.isBomb)?"💣":""))),
              ),
            ),
          ),
        ));
  }
}

bombBox(BuildContext context) => BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: Colors.white),
    );

flagBox(BuildContext context) => BoxDecoration(
      color: Theme.of(context).colorScheme.primaryVariant,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: Colors.green),
    );

hoverBox(BuildContext context) => BoxDecoration(
      color: Theme.of(context).colorScheme.primaryVariant,
      border: Border.all(color: Colors.white, width: 2),
    );

unknownBox(BuildContext context) => BoxDecoration(
      color: Theme.of(context).colorScheme.primaryVariant,
      border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.3), width: 1),
      boxShadow: [BoxShadow()]
    );

cleanBox(BuildContext context) => BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.3), width: 1),
    );
