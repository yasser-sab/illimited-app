import 'package:flutter/material.dart';
import 'package:illimited_app/widget/option_card.dart';

class SingleChoiceSelector extends StatefulWidget {
  final List<Map<String, dynamic>> answers;

  const SingleChoiceSelector({super.key, required this.answers});

  @override
  State<StatefulWidget> createState() => SingleChoiceSelectorState();
}

class SingleChoiceSelectorState extends State<SingleChoiceSelector> {
  String _selectedValue = '';
  // List<Map<String, dynamic>> items =

  void _updateOption(String value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: widget.answers.length,
            // itemCount: 4,

            itemBuilder: (context, index) {
              return OptionCard(
                icon: widget.answers[index]["icon"],
                text: widget.answers[index]["text"],
                selected: _selectedValue,
                updateSelection: _updateOption,
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 5,
            ),
          ),
        ),
        Text(_selectedValue),
      ],
    );
  }
}
