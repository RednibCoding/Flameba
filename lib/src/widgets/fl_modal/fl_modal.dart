import 'dart:async';

import 'package:flutter/material.dart';

import 'fl_modal_type.dart';
import 'src/fl_modal.dart';

Future<bool> showConfirmModal(BuildContext context,
    {required String text, bool dismissible = true, String title = "Info", FlModalType type = FlModalType.info, int duration = 0}) async {
  var completer = Completer<bool>();
  Timer? timer;
  if (duration > 0) {
    timer = Timer(Duration(milliseconds: duration), () {
      completer.complete(true);
      Navigator.of(context, rootNavigator: true).pop();
    });
  }
  showModal(
    context,
    dismissible: dismissible,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: dismissible ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            dismissible
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      completer.complete(true);
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.check_circle),
                  )
                : ElevatedButton(
                    onPressed: () {
                      completer.complete(true);
                      Navigator.pop(context);
                    },
                    child: Text("OK"),
                  ),
            if (dismissible)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel),
              ),
          ],
        )
      ],
    ),
    title: title,
    type: type,
  ).then((value) {
    if (!completer.isCompleted) completer.complete(false);
    timer?.cancel();
    timer = null;
  });
  return completer.future;
}

Future showTextModal(BuildContext context,
    {required String text, Function? onClose, bool dismissible = true, String title = "Info", FlModalType type = FlModalType.info, int duration = 0}) {
  Timer? timer;
  if (duration > 0) {
    timer = Timer(Duration(milliseconds: duration), () {
      Navigator.of(context, rootNavigator: true).pop();
      onClose?.call();
    });
  }
  return showModal(
    context,
    dismissible: dismissible,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SelectableText(text),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            onClose?.call();
          },
          child: Text("OK"),
        )
      ],
    ),
    title: title,
    type: type,
    onClose: onClose,
  ).then((value) {
    timer?.cancel();
    timer = null;
  });
}

Future showModal(BuildContext context,
    {required Widget child, Function? onClose, bool dismissible = true, String title = "Info", FlModalType type = FlModalType.info, int duration = 0}) {
  Timer? timer;
  if (duration > 0) {
    timer = Timer(Duration(milliseconds: duration), () {
      Navigator.of(context, rootNavigator: true).pop();
      onClose?.call();
    });
  }
  return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) => FlModal(
            dismissable: dismissible,
            title: title,
            type: type,
            onClose: onClose,
            child: child,
          )).then((value) {
    timer?.cancel();
    timer = null;
  });
}

Future showModalWithActions(BuildContext context,
    {required Widget child, Function? onClose, bool dismissible = true, String title = "Info", FlModalType type = FlModalType.info, int duration = 0, List<Widget>? actions}) {
  Timer? timer;
  if (duration > 0) {
    timer = Timer(Duration(milliseconds: duration), () {
      Navigator.of(context, rootNavigator: true).pop();
      onClose?.call();
    });
  }
  return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) => FlModal(
            dismissable: dismissible,
            title: title,
            type: type,
            onClose: onClose,
            actions: actions,
            child: child,
          )).then((value) {
    timer?.cancel();
    timer = null;
  });
}

// Future showModal(BuildContext context, {required Widget child, Function? onClose, String title = "Info", bool dismissible = true, FlModalType type = FlModalType.info}) {
//   return showDialog(
//     context: context,
//     barrierDismissible: dismissible,
//     builder: (context) => FlModal(
//       dismissable: dismissible,
//       title: title,
//       type: type,
//       onClose: onClose,
//       child: child,
//     ),
//   );
// }
