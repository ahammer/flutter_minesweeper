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
  final int bombs;
  @override
  final DateTime startTime;
  @override
  final BuiltList<MineSweeperNode> nodes;

  factory _$MineSweeper([void Function(MineSweeperBuilder) updates]) =>
      (new MineSweeperBuilder()..update(updates)).build();

  _$MineSweeper._(
      {this.width, this.height, this.bombs, this.startTime, this.nodes})
      : super._() {
    if (width == null) {
      throw new BuiltValueNullFieldError('MineSweeper', 'width');
    }
    if (height == null) {
      throw new BuiltValueNullFieldError('MineSweeper', 'height');
    }
    if (bombs == null) {
      throw new BuiltValueNullFieldError('MineSweeper', 'bombs');
    }
    if (startTime == null) {
      throw new BuiltValueNullFieldError('MineSweeper', 'startTime');
    }
    if (nodes == null) {
      throw new BuiltValueNullFieldError('MineSweeper', 'nodes');
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
        bombs == other.bombs &&
        startTime == other.startTime &&
        nodes == other.nodes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, width.hashCode), height.hashCode), bombs.hashCode),
            startTime.hashCode),
        nodes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MineSweeper')
          ..add('width', width)
          ..add('height', height)
          ..add('bombs', bombs)
          ..add('startTime', startTime)
          ..add('nodes', nodes))
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

  int _bombs;
  int get bombs => _$this._bombs;
  set bombs(int bombs) => _$this._bombs = bombs;

  DateTime _startTime;
  DateTime get startTime => _$this._startTime;
  set startTime(DateTime startTime) => _$this._startTime = startTime;

  ListBuilder<MineSweeperNode> _nodes;
  ListBuilder<MineSweeperNode> get nodes =>
      _$this._nodes ??= new ListBuilder<MineSweeperNode>();
  set nodes(ListBuilder<MineSweeperNode> nodes) => _$this._nodes = nodes;

  MineSweeperBuilder();

  MineSweeperBuilder get _$this {
    if (_$v != null) {
      _width = _$v.width;
      _height = _$v.height;
      _bombs = _$v.bombs;
      _startTime = _$v.startTime;
      _nodes = _$v.nodes?.toBuilder();
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
              bombs: bombs,
              startTime: startTime,
              nodes: nodes.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'nodes';
        nodes.build();
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

class _$MineSweeperNode extends MineSweeperNode {
  @override
  final bool isVisible;
  @override
  final bool isTagged;
  @override
  final bool isBomb;

  factory _$MineSweeperNode([void Function(MineSweeperNodeBuilder) updates]) =>
      (new MineSweeperNodeBuilder()..update(updates)).build();

  _$MineSweeperNode._({this.isVisible, this.isTagged, this.isBomb})
      : super._() {
    if (isVisible == null) {
      throw new BuiltValueNullFieldError('MineSweeperNode', 'isVisible');
    }
    if (isTagged == null) {
      throw new BuiltValueNullFieldError('MineSweeperNode', 'isTagged');
    }
  }

  @override
  MineSweeperNode rebuild(void Function(MineSweeperNodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MineSweeperNodeBuilder toBuilder() =>
      new MineSweeperNodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MineSweeperNode &&
        isVisible == other.isVisible &&
        isTagged == other.isTagged &&
        isBomb == other.isBomb;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, isVisible.hashCode), isTagged.hashCode), isBomb.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MineSweeperNode')
          ..add('isVisible', isVisible)
          ..add('isTagged', isTagged)
          ..add('isBomb', isBomb))
        .toString();
  }
}

class MineSweeperNodeBuilder
    implements Builder<MineSweeperNode, MineSweeperNodeBuilder> {
  _$MineSweeperNode _$v;

  bool _isVisible;
  bool get isVisible => _$this._isVisible;
  set isVisible(bool isVisible) => _$this._isVisible = isVisible;

  bool _isTagged;
  bool get isTagged => _$this._isTagged;
  set isTagged(bool isTagged) => _$this._isTagged = isTagged;

  bool _isBomb;
  bool get isBomb => _$this._isBomb;
  set isBomb(bool isBomb) => _$this._isBomb = isBomb;

  MineSweeperNodeBuilder();

  MineSweeperNodeBuilder get _$this {
    if (_$v != null) {
      _isVisible = _$v.isVisible;
      _isTagged = _$v.isTagged;
      _isBomb = _$v.isBomb;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MineSweeperNode other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MineSweeperNode;
  }

  @override
  void update(void Function(MineSweeperNodeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MineSweeperNode build() {
    final _$result = _$v ??
        new _$MineSweeperNode._(
            isVisible: isVisible, isTagged: isTagged, isBomb: isBomb);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
