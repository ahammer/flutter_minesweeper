// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine_sweeper.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MineSweeper extends MineSweeper {
  @override
  final int width;
  @override
  final int height;
  @override
  final DateTime startTime;
  @override
  final BuiltList<bool> visibleList;
  @override
  final BuiltList<bool> mineList;

  factory _$MineSweeper([void Function(MineSweeperBuilder) updates]) =>
      (new MineSweeperBuilder()..update(updates)).build();

  _$MineSweeper._(
      {this.width,
      this.height,
      this.startTime,
      this.visibleList,
      this.mineList})
      : super._() {
    if (width == null) {
      throw new BuiltValueNullFieldError('MineSweeper', 'width');
    }
    if (height == null) {
      throw new BuiltValueNullFieldError('MineSweeper', 'height');
    }
    if (startTime == null) {
      throw new BuiltValueNullFieldError('MineSweeper', 'startTime');
    }
    if (visibleList == null) {
      throw new BuiltValueNullFieldError('MineSweeper', 'visibleList');
    }
    if (mineList == null) {
      throw new BuiltValueNullFieldError('MineSweeper', 'mineList');
    }
  }

  @override
  MineSweeper rebuild(void Function(MineSweeperBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MineSweeperBuilder toBuilder() => new MineSweeperBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MineSweeper &&
        width == other.width &&
        height == other.height &&
        startTime == other.startTime &&
        visibleList == other.visibleList &&
        mineList == other.mineList;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, width.hashCode), height.hashCode),
                startTime.hashCode),
            visibleList.hashCode),
        mineList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MineSweeper')
          ..add('width', width)
          ..add('height', height)
          ..add('startTime', startTime)
          ..add('visibleList', visibleList)
          ..add('mineList', mineList))
        .toString();
  }
}

class MineSweeperBuilder implements Builder<MineSweeper, MineSweeperBuilder> {
  _$MineSweeper _$v;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  DateTime _startTime;
  DateTime get startTime => _$this._startTime;
  set startTime(DateTime startTime) => _$this._startTime = startTime;

  ListBuilder<bool> _visibleList;
  ListBuilder<bool> get visibleList =>
      _$this._visibleList ??= new ListBuilder<bool>();
  set visibleList(ListBuilder<bool> visibleList) =>
      _$this._visibleList = visibleList;

  ListBuilder<bool> _mineList;
  ListBuilder<bool> get mineList =>
      _$this._mineList ??= new ListBuilder<bool>();
  set mineList(ListBuilder<bool> mineList) => _$this._mineList = mineList;

  MineSweeperBuilder();

  MineSweeperBuilder get _$this {
    if (_$v != null) {
      _width = _$v.width;
      _height = _$v.height;
      _startTime = _$v.startTime;
      _visibleList = _$v.visibleList?.toBuilder();
      _mineList = _$v.mineList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MineSweeper other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MineSweeper;
  }

  @override
  void update(void Function(MineSweeperBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MineSweeper build() {
    _$MineSweeper _$result;
    try {
      _$result = _$v ??
          new _$MineSweeper._(
              width: width,
              height: height,
              startTime: startTime,
              visibleList: visibleList.build(),
              mineList: mineList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'visibleList';
        visibleList.build();
        _$failedField = 'mineList';
        mineList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MineSweeper', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
