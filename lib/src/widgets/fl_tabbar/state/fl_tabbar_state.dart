import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../flameba.dart';

part 'fl_tabbar_state.g.dart';

class FlTabbarState = _FlTabbarStateBase with _$FlTabbarState;

abstract class _FlTabbarStateBase with Store {
  late TabController? controller;

  @observable
  int activeIndex = 0;

  List<FlTab>? tabs = [];

  @action
  void setSelectedIndex(int index) {
    if (activeIndex == index) return;
    controller!.animateTo(index);
    tabs![index].onTap?.call();
    tabs![activeIndex].onPopScope?.call();
    activeIndex = index;

    print("Active Index is: $activeIndex");
  }
}
