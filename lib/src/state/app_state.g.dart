// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final String theme;
  @override
  final MineSweeper mineSweeper;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.theme, this.mineSweeper}) : super._() {
    if (theme == null) {
      throw new BuiltValueNullFieldError('AppState', 'theme');
    }
    if (mineSweeper == null) {
      throw new BuiltValueNullFieldError('AppState', 'mineSweeper');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        theme == other.theme &&
        mineSweeper == other.mineSweeper;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, theme.hashCode), mineSweeper.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('theme', theme)
          ..add('mineSweeper', mineSweeper))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  String _theme;
  String get theme => _$this._theme;
  set theme(String theme) => _$this._theme = theme;

  MineSweeperBuilder _mineSweeper;
  MineSweeperBuilder get mineSweeper =>
      _$this._mineSweeper ??= new MineSweeperBuilder();
  set mineSweeper(MineSweeperBuilder mineSweeper) =>
      _$this._mineSweeper = mineSweeper;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _theme = _$v.theme;
      _mineSweeper = _$v.mineSweeper?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(theme: theme, mineSweeper: mineSweeper.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'mineSweeper';
        mineSweeper.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
