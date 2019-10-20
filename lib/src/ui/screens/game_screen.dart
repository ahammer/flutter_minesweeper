import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mine_sweeper/src/state/actions/game_actions.dart';
import 'package:mine_sweeper/src/state/actions/minesweeper_actions.dart';
import 'package:mine_sweeper/src/state/app_state.dart';
import 'package:mine_sweeper/src/ui/components/game_board.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(        
        actions: <Widget>[
          Container(width:20),
          Center(child: ThemeSelectWidget()),
          Container(width:20),
          Center(child: GameDifficultyWidget()),
          Center(child: IconButton(icon: Icon(Icons.play_arrow), onPressed: () {
            final store = Provider.of<Store<AppState>>(context);
            final query = MediaQuery.of(context);
            store.dispatch(NewGameAction(difficulty: store.state.difficulty, width: query.size.width.toInt(), height: query.size.height.toInt()));
          })),
          Expanded(child: Container()),
          Center(child: Container(child: BombsRemaining())),    
          Center(child:GameTimer()),    
          
          
        ],
      ),
      body: GameBoard());

}

class ThemeSelectWidget extends StatelessWidget {
  const ThemeSelectWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      distinct: true,
      converter: (store)=>store.state.theme,
      builder:(ctx, value)=>DropdownButton(
        value: value,
      items: <DropdownMenuItem>[
        ...["Light", "Dark"]
            .map((s) => DropdownMenuItem(value: s, child: Text(s)))
      ],
      onChanged: (value) {
        Provider.of<Store<AppState>>(context).dispatch(SetThemeAction(value));
      },
    ));
  }
}

class GameDifficultyWidget extends StatelessWidget {
  const GameDifficultyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      distinct: true,
      converter: (store)=>store.state.difficulty,
      builder:(ctx, value)=>DropdownButton(
        value: value,
      items: <DropdownMenuItem>[
        ...["Easy", "Medium", "Hard"]
            .map((s) => DropdownMenuItem(value: s, child: Text(s)))
      ],
      onChanged: (value) {
        Provider.of<Store<AppState>>(context).dispatch(SetDifficultyAction(value));
      },
    ));
  }
}
