import 'package:flutter/material.dart';
import 'state/fl_tabbar_state.dart';

//FlTab class with a tab and an function
class FlTab {
  String title;
  Function? onPopScope;
  Function? onTap;
  Icon? leadingIcon;
  Icon? trailingIcon;
  FlTab({
    required this.title,
    this.onPopScope,
    this.onTap,
    this.leadingIcon,
    this.trailingIcon,
  });
}

class FlTabbar extends StatefulWidget {
  final List<FlTab> tabs;
  final FlTabbarState state;
  final int activeIndex;
  final double tabBarHeight;
  final Color? color;

  FlTabbar({
    Key? key,
    required this.tabs,
    required this.state,
    this.activeIndex = 0,
    this.tabBarHeight = 50,
    this.color,
  }) : super(key: key) {
    //state.activeIndex = activeIndex;
    state.tabs = tabs;
  }

  @override
  State<FlTabbar> createState() => _FlTabbarState();
}

class _FlTabbarState extends State<FlTabbar> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.state.activeIndex = widget.activeIndex;
    widget.state.controller = TabController(vsync: this, length: widget.tabs.length, initialIndex: widget.state.activeIndex);
  }

  @override
  void dispose() {
    widget.state.controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //widget.state.controller!.index = widget.state.activeIndex;
    return TabBar(
      isScrollable: true,
      labelColor: (widget.color == null) ? Theme.of(context).primaryColor : widget.color,
      indicatorColor: (widget.color == null) ? Theme.of(context).primaryColor : widget.color,
      unselectedLabelColor: Colors.black,
      labelPadding: EdgeInsets.all(0),
      tabs: [
        for (int i = 0; i < widget.state.tabs!.length; i++) _makeTab(i),
      ],
      controller: widget.state.controller,
      onTap: (index) {
        widget.state.setSelectedIndex(index);
      },
    );
  }

  Widget _makeTab(int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Tab(
        height: widget.tabBarHeight,
        child: Row(
          children: [
            widget.state.tabs![i].leadingIcon != null
                ? Container(
                    padding: EdgeInsets.only(right: 8),
                    child: widget.state.tabs![i].leadingIcon!,
                  )
                : Container(),
            Text(widget.state.tabs![i].title),
            widget.state.tabs![i].trailingIcon != null
                ? Container(
                    padding: EdgeInsets.only(left: 8),
                    child: widget.state.tabs![i].trailingIcon!,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
