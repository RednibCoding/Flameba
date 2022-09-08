import 'package:mobx/mobx.dart';

part 'fl_tabview_item_state.g.dart';

class FlTabviewItemState = _FlTabviewItemStateBase with _$FlTabviewItemState;

abstract class _FlTabviewItemStateBase with Store {
  _FlTabviewItemStateBase({this.disabled = false, this.hidden = false});

  @observable
  bool disabled;

  @observable
  bool hidden;

  void enable() {
    disabled = false;
  }

  void disable() {
    disabled = true;
  }

  void show() {
    hidden = false;
  }

  void hide() {
    hidden = true;
  }
}
