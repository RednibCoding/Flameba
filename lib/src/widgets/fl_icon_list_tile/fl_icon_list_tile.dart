import "package:flutter/material.dart";

class FlIconListTile extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function()? onTab;

  FlIconListTile({
    required this.icon,
    required this.title,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTab,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
