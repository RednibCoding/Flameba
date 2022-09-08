// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'state/fl_tabview_item_state.dart';

class FlTabviewItem {
  String title;
  Widget body;
  Function? onPopScope;
  FlTabviewItemState state;
  Icon? leadingIcon;
  Icon? trailingIcon;

  FlTabviewItem({
    required this.title,
    required this.body,
    required this.state,
    this.onPopScope,
    this.leadingIcon,
    this.trailingIcon,
  });
}
