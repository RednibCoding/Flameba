// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fl_tabview_item_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlTabviewItemState on _FlTabviewItemStateBase, Store {
  final _$disabledAtom = Atom(name: '_FlTabviewItemStateBase.disabled');

  @override
  bool get disabled {
    _$disabledAtom.reportRead();
    return super.disabled;
  }

  @override
  set disabled(bool value) {
    _$disabledAtom.reportWrite(value, super.disabled, () {
      super.disabled = value;
    });
  }

  final _$hiddenAtom = Atom(name: '_FlTabviewItemStateBase.hidden');

  @override
  bool get hidden {
    _$hiddenAtom.reportRead();
    return super.hidden;
  }

  @override
  set hidden(bool value) {
    _$hiddenAtom.reportWrite(value, super.hidden, () {
      super.hidden = value;
    });
  }

  @override
  String toString() {
    return '''
disabled: ${disabled},
hidden: ${hidden}
    ''';
  }
}
