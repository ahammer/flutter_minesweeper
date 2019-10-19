
import 'package:mine_sweeper/src/scaffolding/mine_redux.dart';

class SetThemeAction extends Reducer {
  final String theme;
  SetThemeAction(this.theme);

  @override
  get reducer => (oldState) => oldState.rebuild((b) => b..theme = theme);
}
