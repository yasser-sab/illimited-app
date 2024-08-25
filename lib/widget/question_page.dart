import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/single_choice_selector.dart';

class QuestionPage extends StatelessWidget {
  final String question;
  final List<Map<String, dynamic>> answers;
  final int questionIndex;

  const QuestionPage({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            question,
            style: getFontStyle(context).copyWith(color: Colors.black, fontSize: 20),
          ),
        ),
        const SizedBox(height: 10,),
        Expanded(
          child: SingleChoiceSelector(
            answers: answers,
            questionIndex: questionIndex,
          ),
        ),
      ],
    );
  }
}
