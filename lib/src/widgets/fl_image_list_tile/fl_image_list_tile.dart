import "package:flutter/material.dart";

class FlImageListTile extends StatelessWidget {
  final String? icon;
  final String title;
  final Color? backgroundColor;
  final Function()? onTab;

  FlImageListTile({
    required this.icon,
    required this.title,
    this.backgroundColor,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.66),
      child: ListTile(
        onTap: onTab,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: CircleAvatar(
          radius: 32,
          foregroundImage: icon != null ? Image.asset(icon!).image : null,
          //Backgroundcolor theme of the app
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        ),
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
