import 'package:flutter/material.dart';

class OptionCard extends StatefulWidget {
  const OptionCard({
    super.key,
    required this.icon,
    required this.text,
    required this.selected,
    required this.updateSelection,
  });

  final Function(String) updateSelection;

  final IconData icon;
  final String text;
  final String selected;

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool isOptionSelected() {
    return widget.text == widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isOptionSelected() ? Colors.blue : Colors.grey.shade300,
          width: 1.0,
        ),
        color: isOptionSelected() ? Colors.cyan[100] : null,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: isOptionSelected()
                ? Colors.blue.withOpacity(0.5)
                : Colors.transparent,
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(widget.icon),
        splashColor: Colors.transparent,
        title: Text(widget.text),
        onTap: () {
          setState(() {
            widget.updateSelection(widget.text);
          });
        },
      ),
    );
  }
}
