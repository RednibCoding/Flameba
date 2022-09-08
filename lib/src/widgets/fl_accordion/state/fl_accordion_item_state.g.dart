// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fl_accordion_item_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlAccordionItemState on _FlAccordionItemStateBase, Store {
  final _$hiddenAtom = Atom(name: '_FlAccordionItemStateBase.hidden');

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

  final _$disabledAtom = Atom(name: '_FlAccordionItemStateBase.disabled');

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

  final _$expandedAtom = Atom(name: '_FlAccordionItemStateBase.expanded');

  @override
  bool get expanded {
    _$expandedAtom.reportRead();
    return super.expanded;
  }

  @override
  set expanded(bool value) {
    _$expandedAtom.reportWrite(value, super.expanded, () {
      super.expanded = value;
    });
  }

  final _$softWrapAtom = Atom(name: '_FlAccordionItemStateBase.softWrap');

  @override
  bool get softWrap {
    _$softWrapAtom.reportRead();
    return super.softWrap;
  }

  @override
  set softWrap(bool value) {
    _$softWrapAtom.reportWrite(value, super.softWrap, () {
      super.softWrap = value;
    });
  }

  @override
  String toString() {
    return '''
hidden: ${hidden},
disabled: ${disabled},
expanded: ${expanded},
softWrap: ${softWrap}
    ''';
  }
}
