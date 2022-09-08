import 'package:flutter/material.dart';

class FlImageProgressIndicator extends StatelessWidget {
  final String? image;
  FlImageProgressIndicator({this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: image != null
            ? Center(
                child: Image.asset(image!, width: 150, height: 150, gaplessPlayback: true),
              )
            : Center(child: CircularProgressIndicator()),
        backgroundColor: Colors.white.withOpacity(1.0));
  }
}
