import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
part 'mine_sweeper.g.dart';

//This will represent the App State
abstract class MineSweeper implements Built<MineSweeper, MineSweeperBuilder> {
  MineSweeper._();

  factory MineSweeper([void Function(MineSweeperBuilder) updates]) =
      _$MineSweeper;

  //Factory constructor to create a new game
  factory MineSweeper.newGame(
      {int width = 20, int height = 20, int bombs = 10}) {
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
}

//Represents a node on the MineSweeper board
//Tracks visibility, whether it's a bomb, or if it's been tagged
abstract class MineSweeperNode
    implements Built<MineSweeperNode, MineSweeperNodeBuilder> {
  MineSweeperNode._();

  factory MineSweeperNode([void Function(MineSweeperNodeBuilder) updates]) =
      _$MineSweeperNode;

  bool get isVisible;

  bool get isTagged;

  //We don't decide bombs until after the first tap
  @nullable
  bool get isBomb;
}
