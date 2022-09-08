// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'fl_accordion_item.dart';
import 'state/fl_accordion_state.dart';

class FlAccordion extends StatefulWidget {
  final FlAccordionState state;
  Function? onPopScope;
  bool singleExpandedOnly;

  FlAccordion({
    Key? key,
    required List<FlAccordionItem> items,
    required this.state,
    this.onPopScope,
    this.singleExpandedOnly = false,
  }) : super(key: key) {
    state.items = ObservableList.of(items);
    state.singleExpandedOnly = singleExpandedOnly;
  }

  @override
  State<FlAccordion> createState() => _FlAccordionState();
}

class _FlAccordionState extends State<FlAccordion> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.onPopScope?.call();
        return true;
      },
      child: Observer(builder: (context) {
        // return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //   for (int i = 0; i < widget.state.items.length; i++) _makeItem(widget.state.items[i], widget.state),
        // ]);
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.state.items.length,
          itemBuilder: (context, index) => _makeItem(widget.state.items[index], widget.state),
        );
      }),
    );
  }

  //this helperfunction passes the parent state to the individual items to acess the state there
  FlAccordionItem _makeItem(FlAccordionItem item, FlAccordionState state) {
    return FlAccordionItem(
        body: item.body, title: item.title, state: item.state, leadingIcon: item.leadingIcon, trailingIcon: item.trailingIcon, parentState: state);
  }
}
