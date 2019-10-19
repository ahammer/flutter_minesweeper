import 'package:flutter_test/flutter_test.dart';
import 'package:mine_sweeper/src/state/actions/set_theme_action.dart';
import 'package:mine_sweeper/src/state/app_state.dart';

main() {
  test("Test the initial conditions of AppState",() {
    final appState = AppState.getDefault();
    expect(appState.theme, equals("Light"));
    expect(appState.mineSweeper, isNotNull);
  });

  test("Test the theme change logic", () {
    final appState = AppState.getDefault();
    final newState = SetThemeAction("Dark").reducer(appState);
    expect(newState.theme, "Dark");
  });
}