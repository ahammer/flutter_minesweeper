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
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: StoreConnector<AppState, MineSweeperNode>(
        converter: (state) =>
            state.state.mineSweeper.getNode(x: widget.x, y: widget.y),
        distinct: true,
        builder: (context, vm) => GestureDetector(
          onTap: () {
            Provider.of<Store<AppState>>(context).dispatch(
                TouchMineSweeperTileAction(x: widget.x, y: widget.y));
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
                  : hover ? hoverBox(context) : unknownBox(context),
              duration: Duration(milliseconds: 500),
              child: Center(
                  child: Text(vm.isVisible
                      ? (vm.isBomb ?? false)
                          ? "💣"
                          : "${vm.neighbours == 0 ? "" : vm.neighbours}"
                      : (vm.isTagged ? "🏳" : ""))),
            ),
          ),
        ),
      ),
    );
  }
}

bombBox(BuildContext context) =>
    BoxDecoration(color: Colors.red,
    borderRadius: BorderRadius.circular(50)
    , boxShadow: [BoxShadow(color: Colors.blue)]);

hoverBox(BuildContext context) =>
    BoxDecoration(color: Theme.of(context).colorScheme.primaryVariant,    
    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 4, spreadRadius: 4)]);

unknownBox(BuildContext context) =>
    BoxDecoration(color: Theme.of(context).colorScheme.primaryVariant    
    , boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 3, spreadRadius: 1)]);

cleanBox(BuildContext context) =>
    BoxDecoration(color: Theme.of(context).colorScheme.surface,
    boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 2)] );

