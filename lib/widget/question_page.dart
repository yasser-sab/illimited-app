import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/widget/single_choice_selector.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class QuestionPage extends StatefulWidget {
  final String question;
  final List<Map<String, dynamic>> answers;
  final int questionIndex;
  final int type;

  const QuestionPage({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.answers,
    this.type = 0,
  });

  Future<List<Map<String, String>>> loadCountries() async {
    final String response =
        await rootBundle.loadString('assets/countries.json');
    final List<dynamic> data = await json.decode(response);

    final List<Map<String, String>> countries = data.map((country) {
      return Map<String, String>.from(country);
    }).toList();

    return countries;
  }

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  TextEditingController _typeAheadController = TextEditingController();

  late Future<List<Map<String, String>>> countries;

  @override
  void initState() {
    super.initState();

    if (widget.type == 1) countries = widget.loadCountries();
  }

  @override
  Widget build(BuildContext context) {
    final _questionProvider =
        Provider.of<QuestionProvider>(context, listen: true);

    _typeAheadController.text = _questionProvider.answers[widget.questionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            widget.question,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        (widget.type == 0)
            ? Expanded(
                child: SingleChoiceSelector(
                  answers: widget.answers,
                  questionIndex: widget.questionIndex,
                ),
              )
            : TypeAheadField<Map<String, String>>(
                controller: _typeAheadController,
                builder: (context, controller, focusNode) => TextField(
                  controller: controller,
                  focusNode: focusNode,
                  autofocus: true,
                  style: TextStyle(
                    color: Colors.black, // Text color
                    fontSize: 16.0, // Text size
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Image.asset('assets/icon/country.png'),
                    labelText: AppLocalizations.of(context)!.country, // Placeholder text
                    labelStyle: TextStyle(
                      color: Colors.grey, // Label color
                      fontSize: 14.0, // Label text size
                    ),
                    hintText: AppLocalizations.of(context)!.typeHere,
                    hintStyle: TextStyle(
                      color: Colors.grey[600], // Hint text color
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Colors.grey[400]!, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Colors.blue, // Focused border color
                        width: 2.0, // Focused border width
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Colors.grey[400]!, // Enabled border color
                        width: 1.0, // Enabled border width
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ), // Padding inside the TextField
                  ),
                ),
                suggestionsCallback: getCountryName,
                itemBuilder: (BuildContext context, Map<String, String> value) {
                  return ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        value["code"]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      value["name"]!,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
                onSelected: (value) {
                  _typeAheadController.text = value["name"]!;

                  _questionProvider.setAnswerAt(
                      value["name"]!, widget.questionIndex);
                },
              ),
      ],
    );
  }

  Future<List<Map<String, String>>> getCountryName(String value) async {
    List<Map<String, String>> names = await countries;
    List<Map<String, String>> result = names
        .where((country) =>
            country['name']!.toLowerCase().contains(value.toLowerCase()))
        .map((country) => country)
        .toList();

    return result;
  }
}