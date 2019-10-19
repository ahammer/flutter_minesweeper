import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';

import 'package:mine_sweeper/src/state/mine_sweeper_node.dart';

part 'mine_sweeper.g.dart';

//This will represent the App State
abstract class MineSweeper implements Built<MineSweeper, MineSweeperBuilder> {
  MineSweeper._();

  factory MineSweeper([void Function(MineSweeperBuilder) updates]) =
      _$MineSweeper;

  
  //Factory constructor to create a new game
  factory MineSweeper.newGame(
      {int width = 10, int height = 10, int bombs = 20}) {
    //Build the node list
    final nodes = List<MineSweeperNode>();
    for (int i = 0; i < width * height; i++) {
      nodes.add(MineSweeperNode((b) => b
        ..isVisible = false
        ..isTagged = false));
    }

    //Build the MineSweeper game object
    return MineSweeper((b) => b
      ..height = height
      ..width = width
      ..bombs = bombs
      ..startTime = DateTime.now()
      ..nodes.replace(nodes));
  }
  

  int get width;
  int get height;
  int get bombs;
  DateTime get startTime;
  BuiltList<MineSweeperNode> get nodes;

  //Check for Visible Bombs (That's game over)
  
  bool isGameOver() => nodes.fold(
      false, (gameOver, node) => gameOver || (node.isVisible && node.isBomb));

  bool isInBounds(int x, int y) => x >= 0 && y >= 0 && x < width && y < height;

  MineSweeperNode getNode({@required int x, @required int y}) =>
      nodes[x + y * width];
      
}

