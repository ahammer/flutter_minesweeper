import 'package:mine_sweeper/src/scaffolding/mine_redux.dart';
import 'package:mine_sweeper/src/state/app_state.dart';

class TouchMineSweeperTileAction extends Reducer {
  final int x, y;

  TouchMineSweeperTileAction({this.x, this.y});
  @override
  AppState Function(AppState oldState) get reducer =>
      (oldState) => oldState.rebuild((b) {
            if (!oldState.mineSweeper.isInBounds(x, y)) {
              return b;
            }

            //Index position of the node
            final nodeIdx = y * oldState.mineSweeper.width + x;
            final node = oldState.mineSweeper.nodes[nodeIdx];
            final newNode = node.rebuild((b) => b..isVisible = true);
            b.mineSweeper.nodes[nodeIdx] = newNode;
            return b;
          });
}
