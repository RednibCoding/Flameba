import "package:flutter/material.dart";

class FlWindowCard extends StatelessWidget {
  final String title;
  final Widget body;
  final Color? titleColor;
  final Color? titleTextColor;
  final double? width;
  final double? height;

  FlWindowCard({
    required this.title,
    required this.body,
    this.titleColor,
    this.titleTextColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        child: Column(
          children: [
            Container(
              height: 32,
              width: double.maxFinite,
              decoration: BoxDecoration(color: titleColor != null ? titleColor : Theme.of(context).primaryColor),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  title,
                  style: TextStyle(
                    color: titleTextColor != null ? titleTextColor : Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
