// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fl_toggle_button_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlToggleButtonState on _FlToggleButtonStateBase, Store {
  final _$isSelectedAtom = Atom(name: '_FlToggleButtonStateBase.isSelected');

  @override
  bool get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(bool value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  @override
  String toString() {
    return '''
isSelected: ${isSelected}
    ''';
  }
}
