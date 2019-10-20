import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mine_sweeper/src/state/actions/set_theme_action.dart';
import 'package:mine_sweeper/src/state/app_state.dart';
import 'package:mine_sweeper/src/ui/components/game_board.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("MineSweeper - Flutter Edition"),
        actions: <Widget>[
          StoreConnector<AppState, String>(
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
          ))
        ],
      ),
      body: GameBoard());
}
