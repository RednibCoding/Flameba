import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'fl_dropdown_state.g.dart';

class FlDropdownState = _FlDropdownStateBase with _$FlDropdownState;

abstract class _FlDropdownStateBase with Store {
  @observable
  String? value;

  @observable
  List<String?> options = [];

  bool readOnly = false;

  FocusNode focusNode = FocusNode();

  _FlDropdownStateBase({this.value, List<String?>? options, bool firstOptionActive = false, this.readOnly = false}) {
    if (value != null) {
      if (options == null) {
        value = null;
      } else {
        if (!options.contains(value)) {
          value = null;
        }
      }
    }
    if (options != null) {
      this.options = [null, ...options];
    }
    if (firstOptionActive && (options?.isNotEmpty ?? false)) {
      value = options!.first!;
    }
  }

  void requestFocus() {
    focusNode.requestFocus();
  }
}
