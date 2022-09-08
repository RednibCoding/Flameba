// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fl_tabview_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlTabviewState on _FlTabviewStateBase, Store {
  final _$activeIndexAtom = Atom(name: '_FlTabviewStateBase.activeIndex');

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

  final _$tabBarHiddenAtom = Atom(name: '_FlTabviewStateBase.tabBarHidden');

  @override
  bool get tabBarHidden {
    _$tabBarHiddenAtom.reportRead();
    return super.tabBarHidden;
  }

  @override
  set tabBarHidden(bool value) {
    _$tabBarHiddenAtom.reportWrite(value, super.tabBarHidden, () {
      super.tabBarHidden = value;
    });
  }

  final _$tabBarBottomAtom = Atom(name: '_FlTabviewStateBase.tabBarBottom');

  @override
  bool get tabBarBottom {
    _$tabBarBottomAtom.reportRead();
    return super.tabBarBottom;
  }

  @override
  set tabBarBottom(bool value) {
    _$tabBarBottomAtom.reportWrite(value, super.tabBarBottom, () {
      super.tabBarBottom = value;
    });
  }

  @override
  String toString() {
    return '''
activeIndex: ${activeIndex},
tabBarHidden: ${tabBarHidden},
tabBarBottom: ${tabBarBottom}
    ''';
  }
}
