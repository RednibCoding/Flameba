// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fl_textfield_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlTextfieldState on _FlTextfieldStateBase, Store {
  final _$valueAtom = Atom(name: '_FlTextfieldStateBase.value');

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$invalidAtom = Atom(name: '_FlTextfieldStateBase.invalid');

  @override
  bool get invalid {
    _$invalidAtom.reportRead();
    return super.invalid;
  }

  @override
  set invalid(bool value) {
    _$invalidAtom.reportWrite(value, super.invalid, () {
      super.invalid = value;
    });
  }

  final _$lockedAtom = Atom(name: '_FlTextfieldStateBase.locked');

  @override
  bool get locked {
    _$lockedAtom.reportRead();
    return super.locked;
  }

  @override
  set locked(bool value) {
    _$lockedAtom.reportWrite(value, super.locked, () {
      super.locked = value;
    });
  }

  final _$readonlyAtom = Atom(name: '_FlTextfieldStateBase.readonly');

  @override
  bool get readonly {
    _$readonlyAtom.reportRead();
    return super.readonly;
  }

  @override
  set readonly(bool value) {
    _$readonlyAtom.reportWrite(value, super.readonly, () {
      super.readonly = value;
    });
  }

  @override
  String toString() {
    return '''
value: ${value},
invalid: ${invalid},
locked: ${locked},
readonly: ${readonly}
    ''';
  }
}
