import 'package:flutter/material.dart';

class FlTextScale extends StatelessWidget {
  final Widget child;
  final double smallTextfactor;
  final int sizeThreshold;

  const FlTextScale({
    Key? key,
    required this.child,
    this.smallTextfactor = 0.66,
    this.sizeThreshold = 800,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(
        textScaleFactor: mediaQueryData.size.width < sizeThreshold ? smallTextfactor : 1,
      ),
      child: child,
    );
  }
}
