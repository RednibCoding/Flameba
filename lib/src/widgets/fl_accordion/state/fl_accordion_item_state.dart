import 'package:mobx/mobx.dart';

part 'fl_accordion_item_state.g.dart';

class FlAccordionItemState = _FlAccordionItemStateBase with _$FlAccordionItemState;

abstract class _FlAccordionItemStateBase with Store {
  @observable
  bool hidden;
  @observable
  bool disabled;
  @observable
  bool expanded;
  @observable
  bool softWrap;

  Function? onExpand;
  Function? onCollapse;

  _FlAccordionItemStateBase({
    this.hidden = false,
    this.disabled = false,
    this.expanded = false,
    this.softWrap = false,
    this.onExpand,
    this.onCollapse,
  });

  void toggleExpansion() {
    if (expanded) {
      collapse();
    } else {
      if (!disabled) {
        expand();
      }
    }
  }

  void toggleDisabled() {
    disabled = !disabled;
  }

  void toggleHidden() {
    hidden = !hidden;
  }

  void collapse() {
    if (expanded) {
      onCollapse?.call();
    }
    expanded = false;
  }

  void expand() {
    if (!disabled) {
      if (!expanded) {
        onExpand?.call();
      }
      expanded = true;
    }
  }

  void show() {
    hidden = false;
  }

  void hide() {
    hidden = true;
  }

  void enable() {
    disabled = false;
  }

  void disable() {
    disabled = true;
  }
}
