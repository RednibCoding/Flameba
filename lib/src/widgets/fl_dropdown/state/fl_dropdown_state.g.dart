// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fl_dropdown_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlDropdownState on _FlDropdownStateBase, Store {
  final _$valueAtom = Atom(name: '_FlDropdownStateBase.value');

  @override
  String? get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String? value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$optionsAtom = Atom(name: '_FlDropdownStateBase.options');

  @override
  List<String?> get options {
    _$optionsAtom.reportRead();
    return super.options;
  }

  @override
  set options(List<String?> value) {
    _$optionsAtom.reportWrite(value, super.options, () {
      super.options = value;
    });
  }

  @override
  String toString() {
    return '''
value: ${value},
options: ${options}
    ''';
  }
}
