import 'package:flutter_test/flutter_test.dart';
import 'package:mine_sweeper/src/state/actions/minesweeper_actions.dart';
import 'package:mine_sweeper/src/state/app_state.dart';
import 'package:mine_sweeper/src/state/mine_sweeper.dart';

main() {
  test("Test default game creation", (){
    final mineSweeper = MineSweeper.newGame();
    expect(mineSweeper.nodes.length, equals(mineSweeper.width * mineSweeper.height));    
  });

  test("Test a touch", () {
    final AppState appState = AppState.getDefault();
    expect(appState.mineSweeper.getNode(x:4, y:4).isVisible, equals(false));

    final AppState newState = TouchMineSweeperTileAction(x:4,y:4).reduce(appState);
    expect(newState.mineSweeper.getNode(x:4, y:4).isVisible, equals(true));
    
  });
}