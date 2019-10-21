//Represents a node on the MineSweeper board
//Tracks visibility, whether it's a bomb, or if it's been tagged
import 'package:built_value/built_value.dart';
part 'mine_sweeper_node.g.dart';

abstract class MineSweeperNode
    implements Built<MineSweeperNode, MineSweeperNodeBuilder> {
  MineSweeperNode._();

  factory MineSweeperNode([void Function(MineSweeperNodeBuilder) updates]) =
      _$MineSweeperNode;
  
  factory MineSweeperNode.emptyNode() => MineSweeperNode((b)=>b
  ..isBomb = false
  ..isVisible = true
  ..isTagged = false
  ..neighbours = 1);

  bool get isVisible;
  bool get isTagged;
  int get neighbours;
  
  //We don't decide bombs until after the first tap
  @nullable
  bool get isBomb;  
  
}
