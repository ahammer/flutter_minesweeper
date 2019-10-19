import 'dart:math';

import 'package:mine_sweeper/src/scaffolding/mine_redux.dart';
import 'package:mine_sweeper/src/state/app_state.dart';

class CleanBlanksAction extends Reducer {
  @override  
  AppState Function(AppState oldState) get reducer => (oldState) => oldState.rebuild((b){
    
    for (int x=0;x<oldState.mineSweeper.width;x++) {
      for (int y=0;y<oldState.mineSweeper.height;y++) {
        
        final node = oldState.mineSweeper.getNode(x:x,y:y);
        //Bombs aren't generated yet, lets not run this
        if (node.isBomb == null) 
          return b;
          

        if (!node.isVisible && !node.isBomb) {
          
          
          final n1 = oldState.mineSweeper.getNode(x:x+1, y:y);
          final n2 = oldState.mineSweeper.getNode(x:x, y:y+1);
          final n3 = oldState.mineSweeper.getNode(x:x-1, y:y);
          final n4 = oldState.mineSweeper.getNode(x:x, y:y-1);
          
          
          final hasVisibleNeighbour = 
            (n1 != null && n1.isVisible && !n1.isBomb) ||
            (n2 != null && n2.isVisible && !n2.isBomb) ||
            (n3 != null && n3.isVisible && !n3.isBomb) ||
            (n4 != null && n4.isVisible && !n4.isBomb);
            
            
          if (hasVisibleNeighbour) {
            b.mineSweeper.nodes[x+y*oldState.mineSweeper.width] = node.rebuild((b)=>b..isVisible = true);
          }
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
            final nodeIdx = y * oldState.mineSweeper.width + x;
            final node = oldState.mineSweeper.nodes[nodeIdx];
            final newNode = node.rebuild((b) => b..isVisible = true);            
            b.mineSweeper.nodes[nodeIdx] = newNode;

            //No bombs yet, lets assign now
            if (newNode.isBomb == null) {
              assignBombs(b);
            }
            return b;
          });
}

void assignBombs(AppStateBuilder b) {
  final nodes = b.mineSweeper.nodes;
  final bombCount = b.mineSweeper.bombs;
  final width = b.mineSweeper.width;
  final height = b.mineSweeper.height;
  final random = Random();

  int remaining = bombCount;
  
  //Set all the bombs to false
  for (int i=0;i<width*height;i++) {
    nodes[i] = nodes[i].rebuild((b)=>b..isBomb = false);
  }

  //Assign bombCount at random
  while (remaining > 0) {
    int x = random.nextInt(width);
    int y = random.nextInt(height);
    final idx = x+y*width;
    final node = nodes[idx];
    if (node.isVisible != true && node.isBomb != true) {    
      nodes[idx] = node.rebuild((b)=>b..isBomb = true);
      remaining--;
    }
  }
}
