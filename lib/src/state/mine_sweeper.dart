import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
part 'mine_sweeper.g.dart';

//This will represent the App State
abstract class MineSweeper implements Built<MineSweeper, MineSweeperBuilder> {
  MineSweeper._();
  factory MineSweeper([void Function(MineSweeperBuilder) updates]) = _$MineSweeper;

  int get width;
  int get height;
  DateTime get startTime;

  //A list of Bools for Visibility
  BuiltList<bool> get visibleList;
  //A list of Bools for mine location
  BuiltList<bool> get mineList;
}