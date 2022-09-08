import 'package:mobx/mobx.dart';

part 'fl_toggle_button_state.g.dart';

class FlToggleButtonState = _FlToggleButtonStateBase with _$FlToggleButtonState;

abstract class _FlToggleButtonStateBase with Store {
  @observable
  bool isSelected = false;

  _FlToggleButtonStateBase({this.isSelected = false});
}
