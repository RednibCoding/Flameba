// ignore_for_file: prefer_initializing_formals, must_be_immutable

import 'package:flameba/src/widgets/fl_accordion/state/fl_accordion_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'state/fl_accordion_item_state.dart';

class FlAccordionItem extends StatelessWidget {
  final Widget body;
  final String title;
  FlAccordionItemState state;
  Icon? leadingIcon;
  Icon? trailingIcon;
  FlAccordionState? parentState;

  FlAccordionItem({
    required this.body,
    required this.title,
    required this.state,
    this.leadingIcon,
    this.trailingIcon,
    this.parentState,
  });

  @override
  Widget build(BuildContext context) {
    if (state.disabled) {
      //disabled cards are not expandable
      state.collapse();
    }

    return Observer(builder: (context) {
      return state.hidden
          ? Container()
          : Card(
              child: IgnorePointer(
                ignoring: state.disabled,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () => _handleExpansion(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        (leadingIcon == null) ? Container() : (Icon(leadingIcon?.icon, color: state.disabled ? Colors.grey : Colors.black)),
                                        (leadingIcon == null) ? Container() : SizedBox(width: 8.0),
                                        Expanded(
                                          child: Text(
                                            title,
                                            style: TextStyle(color: state.disabled ? Colors.grey : Colors.black),
                                            overflow: TextOverflow.fade,
                                            softWrap: state.softWrap,
                                          ),
                                        ),
                                        (trailingIcon == null) ? Container() : SizedBox(width: 8.0),
                                        (trailingIcon == null) ? Container() : Icon(leadingIcon?.icon, color: state.disabled ? Colors.grey : Colors.black),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    state.expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                    color: state.disabled ? Colors.grey : Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Align(alignment: Alignment.topLeft, child: state.expanded ? body : Container()),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
    });
  }

  void _handleExpansion() {
    bool? seo = parentState?.singleExpandedOnly;

    if (seo != null && seo == true && !state.expanded) {
      parentState!.collapseAll();
    }
    state.toggleExpansion();
  }
}
