import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';

class OptionCard extends StatefulWidget {
  const OptionCard({
    super.key,
    required this.icon,
    required this.text,
    required this.selected,
    required this.updateSelection,
  });

  final Function(String) updateSelection;

  final String icon;
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
        // boxShadow: [
        //   BoxShadow(
        //     color: isOptionSelected()
        //         ? Colors.blue.withOpacity(0.5)
        //         : Colors.transparent,
        //     spreadRadius: 1,
        //     blurRadius: 10,
        //     offset: Offset(0, 0),
        //   ),
        // ],
      ),
      child: SizedBox(
        height: 70,
        child: Center(
          child: ListTile(
            leading: widget.icon == "" ? null :  Image.asset(widget.icon, width: 50,),
            splashColor: Colors.transparent,
            title: Text(widget.text, style: getFontStyle(context).copyWith(color: Colors.black),),
            onTap: () {
              setState(() {
                widget.updateSelection(widget.text);
              });
            },
          ),
        ),
      ),
    );
  }
}
