import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/single_choice_selector.dart';

class QuestionPage extends StatefulWidget {
  final VoidCallback onNext;
  final String question;
  final List<Map<String, dynamic>> answers;

  const QuestionPage({
    super.key,
    required this.onNext,
    required this.question,
    required this.answers,
  });

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            widget.question,
            style: getFontStyle(context),
          ),
        ),
        SingleChoiceSelector(
          answers: widget.answers,
        ),
      ],
    );
  }
}
