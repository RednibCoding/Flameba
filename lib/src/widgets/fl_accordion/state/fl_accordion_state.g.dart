// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fl_accordion_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlAccordionState on _FlAccordionStateBase, Store {
  final _$itemsAtom = Atom(name: '_FlAccordionStateBase.items');

  @override
  ObservableList<FlAccordionItem> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<FlAccordionItem> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$singleExpandedOnlyAtom =
      Atom(name: '_FlAccordionStateBase.singleExpandedOnly');

  @override
  bool get singleExpandedOnly {
    _$singleExpandedOnlyAtom.reportRead();
    return super.singleExpandedOnly;
  }

  @override
  set singleExpandedOnly(bool value) {
    _$singleExpandedOnlyAtom.reportWrite(value, super.singleExpandedOnly, () {
      super.singleExpandedOnly = value;
    });
  }

  @override
  String toString() {
    return '''
items: ${items},
singleExpandedOnly: ${singleExpandedOnly}
    ''';
  }
}
