import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'state/fl_dropdown_state.dart';

class FlDropdown extends StatefulWidget {
  final FlDropdownState state;
  final Function? onChanged;
  final String noSelectionText;

  const FlDropdown({Key? key, required this.state, this.onChanged, this.noSelectionText = "Keine Auswahl"}) : super(key: key);

  @override
  _FlDropdownState createState() => _FlDropdownState();
}

class _FlDropdownState extends State<FlDropdown> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      try {
        return IgnorePointer(
          ignoring: widget.state.readOnly,
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            value: widget.state.value,
            decoration: InputDecoration(
                labelText: widget.state.value == null ? widget.noSelectionText : "", labelStyle: widget.state.readOnly ? TextStyle(color: Colors.grey) : null),
            onChanged: (newValue) {
              if (newValue != null && newValue != widget.state.value) {
                widget.state.value = newValue;
                widget.onChanged?.call();
              }
            },
            focusNode: widget.state.focusNode,
            items: widget.state.options
                .map((e) => DropdownMenuItem(
                      value: e ?? "",
                      child: widget.state.readOnly ? Text(e ?? "", style: TextStyle(color: Colors.grey)) : Text(e ?? ""),
                    ))
                .toList(),
          ),
        );
      } catch (e) {
        print(e);
        return SizedBox(
          height: 10,
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
