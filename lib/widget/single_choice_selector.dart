import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/widget/option_card.dart';
import 'package:provider/provider.dart';

class SingleChoiceSelector extends StatefulWidget {
  final List<Map<String, dynamic>> answers;
  final int questionIndex;

  const SingleChoiceSelector(
      {super.key, required this.answers, required this.questionIndex});

  @override
  State<StatefulWidget> createState() => SingleChoiceSelectorState();
}

class SingleChoiceSelectorState extends State<SingleChoiceSelector> {
  String _selectedValue = "";
  // List<Map<String, dynamic>> items =

  void _updateOption(String value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _questionProvider =
        Provider.of<QuestionProvider>(context, listen: true);
    if (_questionProvider.answers[widget.questionIndex] != "") {
      _selectedValue = _questionProvider.answers[widget.questionIndex];
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: widget.answers.length,
              // itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return OptionCard(
                  icon: widget.answers[index]["icon"],
                  text: widget.answers[index]["text"],
                  selected: _selectedValue,
                  updateSelection: (value) {
                    log("index ${widget.questionIndex}");
                    log("index ${value}");
                    _questionProvider.setAnswerAt(value, widget.questionIndex);
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
