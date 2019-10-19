import 'package:flutter/material.dart';

const kBoardEdgePadding = 8.0;

class GameBoard extends StatelessWidget {
  const GameBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  kBoardEdgePadding, kBoardEdgePadding, kBoardEdgePadding, 0),
              child: GameBoardHeader(),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(kBoardEdgePadding),
                child: MineField(),
              ),
            ))
          ],
        ));
  }
}

///
/// Header Section of the Gameboard
/// Has the Score, The Timer, and the Reset button
class GameBoardHeader extends StatelessWidget {
  const GameBoardHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Container(color: Colors.red, width: 128, height: 48),
            Expanded(child: Container()),
            Center(
                child: Container(
              color: Colors.green,
              width: 32,
              height: 32,
              child: Icon(Icons.face),
            )),
            Expanded(child: Container()),
            Container(color: Colors.blue, width: 127, height: 48),
          ],
        ),
      ),
    );
  }
}



class MineField extends StatelessWidget {
  const MineField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      width: double.infinity,
      height: double.infinity,
    );
  }
}