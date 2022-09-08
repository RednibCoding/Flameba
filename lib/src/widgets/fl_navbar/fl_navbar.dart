import "package:flutter/material.dart";

class FlNavbar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;
  final List<Widget>? actions;

  FlNavbar(this._title, {this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FittedBox(child: Text(_title)),
      actions: [if (actions?.isNotEmpty ?? false) ...actions!.map((e) => e).toList()],
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}
