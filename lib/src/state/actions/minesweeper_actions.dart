import 'dart:math';
import 'package:built_collection/built_collection.dart';
import 'package:mine_sweeper/src/scaffolding/mine_redux.dart';
import 'package:mine_sweeper/src/state/app_state.dart';
import 'package:mine_sweeper/src/state/mine_sweeper.dart';
import 'package:mine_sweeper/src/state/mine_sweeper_node.dart';

class NewGameAction extends Reducer {
  final MineSweeper newGame;

  NewGameAction(this.newGame);

  @override
  get reducer =>
      (oldState) => oldState.rebuild((b) => b..mineSweeper.replace(newGame));
}

class CleanBlanksAction extends Reducer {
  @override
  get reducer => (oldState) => oldState.rebuild((b) {
        for (int x = 0; x < oldState.mineSweeper.width; x++) {
          for (int y = 0; y < oldState.mineSweeper.height; y++) {
            final node = oldState.mineSweeper.getNode(x: x, y: y);
            //Bombs aren't generated yet, lets not run this
            if (node.isBomb == null) return b;

            if (node.isVisible && !node.isBomb && node.neighbours == 0) {
                flipSurroundingNodes(oldState, b, x, y);                              
            }
          }
        }

        return b;
      });
}

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
            final newNode = flipNode(oldState, b, x, y);

            //No bombs yet, lets assign now
            if (newNode.isBomb == null) {
              //Flip the surrounding nodes (so we are in a blank space)
              flipSurroundingNodes(oldState, b, x, y);
              assignBombs(b);
            }

            return b;
          });

}

  void flipSurroundingNodes(AppState oldState, AppStateBuilder b, int x, int y) {
    flipNode(oldState, b, x+1, y+1);
    flipNode(oldState, b, x+1, y);
    flipNode(oldState, b, x+1, y-1);
    flipNode(oldState, b, x, y+1);
    flipNode(oldState, b, x, y-1);
    flipNode(oldState, b, x-1, y+1);
    flipNode(oldState, b, x-1, y);
    flipNode(oldState, b, x-1, y-1);
  }

  MineSweeperNode flipNode(AppState oldState, AppStateBuilder b, int x, int y) {
    //Bounds check
    if ((x >= oldState.mineSweeper.width) ||
        (y >= oldState.mineSweeper.height) ||
        (x < 0) ||
        (y < 0)) return MineSweeperNode.emptyNode();

    final nodeIdx = y * oldState.mineSweeper.width + x;
    final node = oldState.mineSweeper.nodes[nodeIdx];
    final newNode = node.rebuild((b) => b..isVisible = true);
    b.mineSweeper.nodes[nodeIdx] = newNode;
    return newNode;
  }
void assignBombs(AppStateBuilder b) {
  final nodes = b.mineSweeper.nodes;
  final bombCount = b.mineSweeper.bombs;
  final width = b.mineSweeper.width;
  final height = b.mineSweeper.height;
  final random = Random();

  int remaining = bombCount;

  //Set all the bombs to false
  for (int i = 0; i < width * height; i++) {
    nodes[i] = nodes[i].rebuild((b) => b..isBomb = false);
  }

  //Assign bombCount at random
  while (remaining > 0) {
    int x = random.nextInt(width);
    int y = random.nextInt(height);
    final idx = x + y * width;
    final node = nodes[idx];
    if (node.isVisible != true && node.isBomb != true) {
      nodes[idx] = node.rebuild((b) => b..isBomb = true);
      remaining--;
    }
  }

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int count = countNeighbours(x, y, width, height, nodes);
      final idx = x + y * width;
      final node = nodes[idx];
      //int neighbours = boardWithoutCounts.bombNeighbours(x: x, y: y);
      //print("$x $y $neighbours" );
      nodes[idx] = node.rebuild((b) => b..neighbours = count);
    }
  }
}

int countNeighbours(
    int x, int y, int width, int height, ListBuilder<MineSweeperNode> nodes) {
  final n1 = getNode(x + 1, y + 1, width, height, nodes);
  final n2 = getNode(x + 1, y, width, height, nodes);
  final n3 = getNode(x + 1, y - 1, width, height, nodes);
  final n4 = getNode(x, y + 1, width, height, nodes);
  final n5 = getNode(x, y - 1, width, height, nodes);
  final n6 = getNode(x - 1, y + 1, width, height, nodes);
  final n7 = getNode(x - 1, y, width, height, nodes);
  final n8 = getNode(x - 1, y - 1, width, height, nodes);

  return (n1.isBomb ? 1 : 0) +
      (n2.isBomb ? 1 : 0) +
      (n3.isBomb ? 1 : 0) +
      (n4.isBomb ? 1 : 0) +
      (n5.isBomb ? 1 : 0) +
      (n6.isBomb ? 1 : 0) +
      (n7.isBomb ? 1 : 0) +
      (n8.isBomb ? 1 : 0);
}

MineSweeperNode getNode(
    int x, int y, int width, int height, ListBuilder<MineSweeperNode> nodes) {
  int idx = x + y * width;
  try {
    return nodes[idx];
  } catch (e) {
    return emptyNode;
  }
}
