import 'package:flutter_test/flutter_test.dart';
import 'package:mine_sweeper/src/state/mine_sweeper.dart';

main() {
  test("Test default game creation", (){
    final mineSweeper = MineSweeper.newGame();
    expect(mineSweeper.nodes.length, equals(mineSweeper.width * mineSweeper.height));    
  });
}