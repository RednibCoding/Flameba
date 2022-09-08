// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../fl_tabview_item.dart';

part 'fl_tabview_state.g.dart';

class FlTabviewState = _FlTabviewStateBase with _$FlTabviewState;

abstract class _FlTabviewStateBase with Store {
  late TabController controller;

  _FlTabviewStateBase({this.tabBarHidden = false, this.tabBarBottom = false});
  @observable
  int activeIndex = 0;

  @observable
  bool tabBarHidden;

  @observable
  bool tabBarBottom;

  bool internalPopScope = false;

  void Function(int)? animateToCallback;

  List<FlTabviewItem>? tabs = [];

  // @action
  // void setSelectedIndex(int index) {
  //   if (activeIndex == index) return;
  //   tabs![activeIndex].onPopScope?.call();
  //   activeIndex = index;
  //   animateToCallback?.call(index);
  // }

  void _setTabIndex(int fromIndex, int toIndex) {
    if (fromIndex == toIndex) {
      internalPopScope = true;
      return;
    }
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    if (toIndex < 0) {
      activeIndex = 0;
    } else if (toIndex >= tabs!.length) {
      activeIndex = tabs!.length - 1;
    } else {
      activeIndex = toIndex;
    }

    if (tabs![activeIndex].state.disabled || tabs![activeIndex].state.hidden) {
      activeIndex = fromIndex;
      return;
    }

    controller.animateTo(activeIndex);
    tabs![fromIndex].onPopScope?.call();
    internalPopScope = true;
  }

  void moveToIndex(int index) {
    _setTabIndex(activeIndex, index);
  }

  void _moveIndexByOne(bool loop, int dir) {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;

    var oldIndex = activeIndex;

    // Check wether a selectable tab is present in tab list
    bool selectableFound = tabs?.any((t) => !t.state.disabled || !t.state.hidden) ?? false;
    if (!selectableFound) return;
    if (loop) {
      while (true) {
        activeIndex += dir;
        if (activeIndex >= tabs!.length) {
          activeIndex = 0;
        }
        if (activeIndex < 0) {
          activeIndex = tabs!.length - 1;
        }
        if (tabs![activeIndex].state.disabled || tabs![activeIndex].state.hidden) {
          continue;
        }
        _setTabIndex(oldIndex, activeIndex % tabs!.length);
        return;
      }
    } else {
      while (true) {
        activeIndex += dir;
        if (activeIndex >= tabs!.length) {
          activeIndex = oldIndex;
        }
        if (activeIndex < 0) {
          activeIndex = oldIndex;
        }

        if (tabs![activeIndex].state.disabled || tabs![activeIndex].state.hidden) {
          continue;
        }

        _setTabIndex(oldIndex, activeIndex % tabs!.length);
        return;
      }
    }
  }

  void moveNext({bool loop = true}) {
    _moveIndexByOne(loop, 1);
  }

  void movePrev({bool loop = true}) {
    _moveIndexByOne(loop, -1);
  }

  void enableNext({bool loop = true}) {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    if (activeIndex + 1 >= tabs!.length) {
      if (loop) {
        enableItem(0);
      }
    } else {
      enableItem(activeIndex + 1);
    }
  }

  void enablePrev({bool loop = true}) {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    if (activeIndex - 1 < 0) {
      if (loop) {
        enableItem(tabs!.length - 1);
      }
    } else {
      enableItem(activeIndex - 1);
    }
  }

  void disableNext({bool loop = true}) {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    if (activeIndex + 1 >= tabs!.length) {
      if (loop) {
        disableItem(0);
      }
    } else {
      disableItem(activeIndex + 1);
    }
  }

  void disablePrev({bool loop = true}) {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    if (activeIndex - 1 < 0) {
      if (loop) {
        disableItem(tabs!.length - 1);
      }
    } else {
      disableItem(activeIndex - 1);
    }
  }

  void enableFirst() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    enableItem(0);
  }

  void enableLast() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    enableItem(tabs!.length - 1);
  }

  void disableFirst() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    disableItem(0);
  }

  void disableLast() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    disableItem(tabs!.length - 1);
  }

  void showNext({bool loop = true}) {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    if (activeIndex + 1 >= tabs!.length) {
      if (loop) {
        showItem(0);
      }
    } else {
      showItem(activeIndex + 1);
    }
  }

  void showPrev({bool loop = true}) {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    if (activeIndex - 1 < 0) {
      if (loop) {
        showItem(tabs!.length - 1);
      }
    } else {
      showItem(activeIndex - 1);
    }
  }

  void hideNext({bool loop = true}) {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    if (activeIndex + 1 >= tabs!.length) {
      if (loop) {
        hideItem(0);
      }
    } else {
      hideItem(activeIndex + 1);
    }
  }

  void hidePrev({bool loop = true}) {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    if (activeIndex - 1 < 0) {
      if (loop) {
        hideItem(tabs!.length - 1);
      }
    } else {
      hideItem(activeIndex - 1);
    }
  }

  void showFirst() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    showItem(0);
  }

  void showLast() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    showItem(tabs!.length - 1);
  }

  void hideFirst() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    hideItem(0);
  }

  void hideLast() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    hideItem(tabs!.length - 1);
  }

  void enableThis() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    enableItem(activeIndex);
  }

  void disableThis() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    disableItem(activeIndex);
  }

  void showThis() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    showItem(activeIndex);
  }

  void hideThis() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    hideItem(activeIndex);
  }

  void moveLast() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;

    var oldIndex = activeIndex;

    // Check wether a selectable tab is present in tab list
    bool selectableFound = tabs?.any((t) => !t.state.disabled || !t.state.hidden) ?? false;
    if (!selectableFound) return;
    var index = tabs!.length - 1;
    while (tabs![index].state.disabled || tabs![index].state.hidden) {
      index--;
    }
    if (index < 0) return;
    _setTabIndex(oldIndex, index);
  }

  void moveFirst() {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;

    var oldIndex = activeIndex;

    // Check wether a selectable tab is present in tab list
    bool selectableFound = tabs?.any((t) => !t.state.disabled || !t.state.hidden) ?? false;
    if (!selectableFound) return;
    var index = 0;
    while (tabs![index].state.disabled || tabs![index].state.hidden) {
      index++;
    }
    if (index >= tabs!.length) return;
    _setTabIndex(oldIndex, index);
  }

  void toggleTabBarVisiblity() {
    tabBarHidden = !tabBarHidden;
  }

  void toggleTabBarPosition() {
    tabBarBottom = !tabBarBottom;
  }

  void enableAll() {
    tabs!.forEach((item) {
      item.state.enable();
    });
  }

  void disableAll() {
    tabs!.forEach((item) {
      item.state.disable();
    });
  }

  void hideAll() {
    tabs!.forEach((item) {
      item.state.hide();
    });
  }

  void showAll() {
    tabs!.forEach((item) {
      item.state.show();
    });
  }

  void showItem(int index) {
    if (index < 0) return;
    if (index >= tabs!.length) return;
    tabs![index].state.show();
  }

  void hideItem(int index) {
    if (index < 0) return;
    if (index >= tabs!.length) return;
    tabs![index].state.hide();
  }

  void enableItem(int index) {
    if (index < 0) return;
    if (index >= tabs!.length) return;
    tabs![index].state.enable();
  }

  void disableItem(int index) {
    if (index < 0) return;
    if (index >= tabs!.length) return;
    tabs![index].state.disable();
  }
}
