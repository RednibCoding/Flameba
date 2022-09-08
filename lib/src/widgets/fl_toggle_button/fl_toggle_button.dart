import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'state/fl_toggle_button_state.dart';

class FlToggleButton extends StatefulWidget {
  final FlToggleButtonState state;
  final Widget child;
  final double width;
  final double height;
  final Function()? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;

  FlToggleButton(
      {Key? key, required this.state, required this.child, this.width = 250, this.height = 50, this.onPressed, this.foregroundColor, this.backgroundColor})
      : super(key: key);

  @override
  State<FlToggleButton> createState() => _FlToggleButtonState();
}

class _FlToggleButtonState extends State<FlToggleButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Observer(builder: (context) {
        return ElevatedButton(
          onPressed: () {
            widget.state.isSelected = !widget.state.isSelected;
            widget.onPressed?.call();
          },
          style: widget.state.isSelected
              ? null
              : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(widget.foregroundColor != null ? widget.foregroundColor : Colors.white),
                  foregroundColor: MaterialStateProperty.all(widget.backgroundColor != null ? widget.backgroundColor : Colors.grey.shade700),
                ),
          child: widget.child,
        );
      }),
    );
  }
}
