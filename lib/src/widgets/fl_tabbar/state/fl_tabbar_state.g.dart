// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fl_tabbar_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlTabbarState on _FlTabbarStateBase, Store {
  final _$activeIndexAtom = Atom(name: '_FlTabbarStateBase.activeIndex');

  @override
  int get activeIndex {
    _$activeIndexAtom.reportRead();
    return super.activeIndex;
  }

  @override
  set activeIndex(int value) {
    _$activeIndexAtom.reportWrite(value, super.activeIndex, () {
      super.activeIndex = value;
    });
  }

  final _$_FlTabbarStateBaseActionController =
      ActionController(name: '_FlTabbarStateBase');

  @override
  void setSelectedIndex(int index) {
    final _$actionInfo = _$_FlTabbarStateBaseActionController.startAction(
        name: '_FlTabbarStateBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(index);
    } finally {
      _$_FlTabbarStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeIndex: ${activeIndex}
    ''';
  }
}
