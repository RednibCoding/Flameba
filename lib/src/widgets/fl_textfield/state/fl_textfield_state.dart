import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'fl_textfield_state.g.dart';

class FlTextfieldState = _FlTextfieldStateBase with _$FlTextfieldState;

abstract class _FlTextfieldStateBase with Store {
  @observable
  String value = "";

  @observable
  String? label = "";

  @observable
  String? errorLabel = "";

  @observable
  bool invalid = false;

  @observable
  bool locked;

  @observable
  bool readonly = false;

  bool hideKeyboard;

  Function? onFocusGet;
  Function? onFocusLost;

  final bool numeric;

  FocusNode focusNode = FocusNode();

  bool _focused = false;

  _FlTextfieldStateBase({this.value = "", this.numeric = false, this.locked = false, this.readonly = false, this.hideKeyboard = true}) {
    // if (numeric && value.isEmpty) value = "0";
    onFocusGet ??= () => {};
    onFocusLost ??= () => {};
    // focusNode = NnFocusNode(suppressKeyboard: hideKeyboard);
    focusNode.addListener(_onFocusChanged);
  }

  void requestFocus() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      focusNode.requestFocus();
    });
  }

  void _onFocusChanged() {
    // Trim the value beforehand
    // Note: value gets also trimmed when onSubmited is triggert: see FlTextField.onSubmitted
    value = value.trim();
    if (focusNode.hasFocus != _focused) {
      if (focusNode.hasFocus) {
        if (onFocusGet != null) {
          onFocusGet!();
          _focused = focusNode.hasFocus;
        }
      } else if (!focusNode.hasFocus) {
        if (onFocusLost != null) {
          onFocusLost!();
          _focused = focusNode.hasFocus;
        }
      }
    }
  }

  void reset() {
    invalid = false;
    locked = false;
    value = "";
  }
}

// class NnFocusNode extends FocusNode {
//   bool suppressKeyboard;
//   NnFocusNode({this.suppressKeyboard = false}) : super();
//   @override
//   bool consumeKeyboardToken() {
//     if (suppressKeyboard) {
//       // prevents keyboard from showing on first focus
//       return false;
//     } else {
//       return super.consumeKeyboardToken();
//     }
//   }
// }
