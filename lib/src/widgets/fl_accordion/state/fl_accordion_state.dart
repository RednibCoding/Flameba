import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../flameba.dart';

part 'fl_accordion_state.g.dart';

class FlAccordionState = _FlAccordionStateBase with _$FlAccordionState;

abstract class _FlAccordionStateBase with Store {
  @observable
  ObservableList<FlAccordionItem> items = ObservableList<FlAccordionItem>();

  @observable
  bool singleExpandedOnly = true;

  void toggleSingleExpandedOnly() {
    singleExpandedOnly = !singleExpandedOnly;
    if (singleExpandedOnly) {
      collapseAll();
    }
  }

  void addItem(FlAccordionItem item) {
    items.add(item);
  }

  void makeItem(String title, Widget body, FlAccordionItemState state, [Icon? leadingIcon, Icon? trailingIcon]) {
    addItem(FlAccordionItem(title: title, body: body, state: state, leadingIcon: leadingIcon, trailingIcon: trailingIcon));
  }

  void insertItem(int index, FlAccordionItem item) {
    items.insert(index, item);
  }

  void makeItemAt(int index, String title, Widget body, FlAccordionItemState state, [Icon? leadingIcon, Icon? trailingIcon]) {
    insertItem(index, FlAccordionItem(title: title, body: body, state: state, leadingIcon: leadingIcon, trailingIcon: trailingIcon));
  }

  void clearItems() {
    items.clear();
  }

  void removeItemById(int index) {
    if (index < 0 || index >= items.length) return;
    items.removeAt(index);
  }

  void collapseAll() {
    items.forEach((item) {
      item.state.collapse();
    });
  }

  void expandAll() {
    items.forEach((item) {
      item.state.expand();
    });
  }

  void showAll() {
    items.forEach((item) {
      item.state.show();
    });
  }

  void hideAll() {
    items.forEach((item) {
      item.state.hide();
    });
  }

  void enableAll() {
    items.forEach((item) {
      item.state.enable();
    });
  }

  void disableAll() {
    items.forEach((item) {
      item.state.disable();
    });
  }

  void toggleExpansion(int index) {
    if (index < 0 || index >= items.length) return;
    items[index].state.toggleExpansion();
  }

  void toggleDisabled(int index) {
    if (index < 0 || index >= items.length) return;
    items[index].state.toggleDisabled();
  }

  void toggleHidden(int index) {
    if (index < 0 || index >= items.length) return;
    items[index].state.toggleHidden();
  }
}
