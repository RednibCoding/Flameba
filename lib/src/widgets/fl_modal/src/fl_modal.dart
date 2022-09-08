import 'package:flutter/material.dart';

import '../fl_modal_type.dart';

class FlModalColors {
  Color info = Colors.blue.shade700;
  Color success = Colors.green.shade700;
  Color warning = Colors.orange.shade700;
  Color error = Colors.red.shade700;
  Color titleText = Colors.white;
}

// This can be used to change the title colors of the modals
FlModalColors flModalColors = FlModalColors();

class FlModal extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget>? actions;
  final FlModalType type;
  final Function? onClose;
  final bool dismissable;

  FlModal({
    required this.title,
    required this.child,
    required this.dismissable,
    this.actions,
    this.type = FlModalType.info,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    Color _titleColor;
    switch (type) {
      case FlModalType.error:
        _titleColor = flModalColors.error;
        break;
      case FlModalType.success:
        _titleColor = flModalColors.success;
        break;
      case FlModalType.warning:
        _titleColor = flModalColors.warning;
        break;
      default:
        _titleColor = flModalColors.info;
    }

    return WillPopScope(
      onWillPop: onClose == null
          ? () async {
              return true;
            }
          : () async {
              onClose!();
              return true;
            },
      child: AlertDialog(
        titlePadding: EdgeInsets.all(0),
        contentPadding: EdgeInsets.all(16.0),
        insetPadding: EdgeInsets.all(0.0),
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        title: Container(
          height: 56,
          decoration: BoxDecoration(color: _titleColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                if (actions?.isNotEmpty ?? false) ...actions!,
                if (dismissable)
                  IconButton(
                    icon: Icon(Icons.close),
                    color: flModalColors.titleText,
                    onPressed: () {
                      if (onClose != null) onClose!();
                      Navigator.pop(context, true);
                    },
                  ),
              ],
            ),
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.all(0),
          child: child,
        ),
      ),
    );
  }
}
