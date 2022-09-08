// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'state/fl_tabview_state.dart';
import 'fl_tabview_item.dart';

class FlTabview extends StatefulWidget {
  final FlTabviewState state;
  final int initialIndex;
  final bool centerTabBar;
  final bool centerBody;
  final bool tabBarHidden;
  final double tabBarHeight;
  Function? onPopScope;
  Color? color;
  FlTabview(
      {Key? key,
      required List<FlTabviewItem> tabs,
      required this.state,
      this.initialIndex = 0,
      this.tabBarHeight = 50,
      this.centerBody = false,
      this.centerTabBar = false,
      this.onPopScope,
      this.color,
      this.tabBarHidden = false})
      : super(key: key) {
    state.tabs = tabs;
  }

  @override
  State<FlTabview> createState() => _FlTabviewState();
}

class _FlTabviewState extends State<FlTabview> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.state.activeIndex = widget.initialIndex;
    widget.state.controller = TabController(
      vsync: this,
      length: widget.state.tabs?.length ?? 0,
      initialIndex: widget.state.activeIndex,
    );
  }

  @override
  void dispose() {
    widget.state.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.state.tabs?[widget.state.activeIndex].onPopScope?.call();
        widget.onPopScope?.call();
        return true;
      },
      child: Observer(
        builder: (context) => widget.state.tabBarBottom
            ? Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.centerBody ? _makeBody() : Align(alignment: Alignment.centerLeft, child: _makeBody()),
                    widget.centerTabBar ? _makeTabBar() : Align(alignment: Alignment.centerLeft, child: _makeTabBar()),
                  ],
                ),
              )
            : Column(
                children: [
                  widget.centerTabBar ? _makeTabBar() : Align(alignment: Alignment.centerLeft, child: _makeTabBar()),
                  widget.centerBody ? _makeBody() : Align(alignment: Alignment.centerLeft, child: _makeBody()),
                ],
              ),
      ),
    );
  }
  // ! Deprecated on tap events of the tabbar get handled by the state in moveToIndex
  // void _onTabChange() {
  //   bool tabEnabled = !widget.state.tabs![widget.state.controller.index].state.disabled;
  //   bool tabVisible = !widget.state.tabs![widget.state.controller.index].state.hidden;
  //   if (tabEnabled && tabVisible) {
  //     if (!widget.state.controller.indexIsChanging) {
  //       if (!widget.state.internalPopScope) {
  //         widget.state.tabs![widget.state.activeIndex].onPopScope?.call();
  //         widget.state.activeIndex = widget.state.controller.index;
  //       } else {
  //         widget.state.internalPopScope = false;
  //       }
  //     }
  //   } else {
  //     widget.state.controller.index = widget.state.activeIndex;
  //   }
  // }

  Widget _makeTab(int i) {
    if (widget.state.tabs![i].state.hidden) {
      return Container();
    } else if (widget.state.tabs![i].state.disabled) {
      //Disabled and visible
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Tab(
          height: widget.tabBarHeight,
          child: Row(
            children: [
              widget.state.tabs![i].leadingIcon != null
                  ? Container(
                      child: Icon(widget.state.tabs![i].leadingIcon!.icon, color: Colors.grey.withOpacity(0.33)),
                    )
                  : Container(),
              Text(widget.state.tabs![i].title, style: TextStyle(color: Colors.grey.withOpacity(0.33))),
              widget.state.tabs![i].trailingIcon != null
                  ? Container(
                      child: Icon(widget.state.tabs![i].trailingIcon!.icon, color: Colors.grey.withOpacity(0.33)),
                    )
                  : Container(),
            ],
          ),
        ),
      );
    } else {
      //Enabled and visible
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Tab(
          height: widget.tabBarHeight,
          child: Row(
            children: [
              widget.state.tabs![i].leadingIcon != null
                  ? Container(
                      child: widget.state.tabs![i].leadingIcon!,
                    )
                  : Container(),
              Text(widget.state.tabs![i].title),
              widget.state.tabs![i].trailingIcon != null
                  ? Container(
                      child: widget.state.tabs![i].trailingIcon!,
                    )
                  : Container(),
            ],
          ),
        ),
      );
    }
  }

  Widget _makeTabBar() {
    return widget.state.tabBarHidden
        ? Container()
        : TabBar(
            controller: widget.state.controller, // _tabController,
            isScrollable: true,
            labelColor: (widget.color == null) ? Theme.of(context).primaryColor : widget.color,
            indicatorColor: (widget.color == null) ? Theme.of(context).primaryColor : widget.color,
            unselectedLabelColor: Colors.black,
            labelPadding: EdgeInsets.all(0),
            //handle on tap events here

            onTap: (index) {
              //! fix for tabbar animating to disabled tabs -> handle animations only in state.moveToIndex
              widget.state.controller.animateTo(widget.state.activeIndex);
              widget.state.moveToIndex(index);
            },
            tabs: [
              // for (var tab in widget.state.tabs ?? [] as List<FlTabviewItem>) _makeTab(tab),
              for (int i = 0; i < widget.state.tabs!.length; i++) _makeTab(i),
            ],
          );
  }

  Widget _makeBody() {
    return widget.state.tabs?[widget.state.activeIndex].body ?? Container();
  }
}
