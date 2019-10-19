// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine_sweeper_node.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MineSweeperNode extends MineSweeperNode {
  @override
  final bool isVisible;
  @override
  final bool isTagged;
  @override
  final int neighbours;
  @override
  final bool isBomb;

  factory _$MineSweeperNode([void Function(MineSweeperNodeBuilder) updates]) =>
      (new MineSweeperNodeBuilder()..update(updates)).build();

  _$MineSweeperNode._(
      {this.isVisible, this.isTagged, this.neighbours, this.isBomb})
      : super._() {
    if (isVisible == null) {
      throw new BuiltValueNullFieldError('MineSweeperNode', 'isVisible');
    }
    if (isTagged == null) {
      throw new BuiltValueNullFieldError('MineSweeperNode', 'isTagged');
    }
    if (neighbours == null) {
      throw new BuiltValueNullFieldError('MineSweeperNode', 'neighbours');
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
        neighbours == other.neighbours &&
        isBomb == other.isBomb;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isVisible.hashCode), isTagged.hashCode),
            neighbours.hashCode),
        isBomb.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MineSweeperNode')
          ..add('isVisible', isVisible)
          ..add('isTagged', isTagged)
          ..add('neighbours', neighbours)
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

  int _neighbours;
  int get neighbours => _$this._neighbours;
  set neighbours(int neighbours) => _$this._neighbours = neighbours;

  bool _isBomb;
  bool get isBomb => _$this._isBomb;
  set isBomb(bool isBomb) => _$this._isBomb = isBomb;

  MineSweeperNodeBuilder();

  MineSweeperNodeBuilder get _$this {
    if (_$v != null) {
      _isVisible = _$v.isVisible;
      _isTagged = _$v.isTagged;
      _neighbours = _$v.neighbours;
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
            isVisible: isVisible,
            isTagged: isTagged,
            neighbours: neighbours,
            isBomb: isBomb);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
