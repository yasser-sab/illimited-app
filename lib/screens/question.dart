import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/progress_bar.dart';
import 'package:illimited_app/widget/question_page.dart';
import 'package:illimited_app/widget/single_choice_selector.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, dynamic>> questions = [
    {
      "question": "what is your gender ?",
      "answers": [
        {
          "text": "Male",
          "icon": Icons.schedule,
        },
        {
          "text": "Female",
          "icon": Icons.bus_alert,
        },
      ]
    },
    {
      "question": "What would you like to improve ?",
      "answers": [
        {
          "text": "your physical well-being",
          "icon": Icons.schedule,
        },
        {
          "text": "your mental well-being",
          "icon": Icons.bus_alert,
        },
        {
          "text": "both",
          "icon": Icons.bus_alert,
        },
      ]
    },
    {
      "question": "What age group do you fall into ?",
      "answers": [
        {
          "text": "12-17 years",
          "icon": Icons.schedule,
        },
        {
          "text": "18-25 years",
          "icon": Icons.bus_alert,
        },
        {
          "text": "25-34 years",
          "icon": Icons.bus_alert,
        },
        // {
        //   "text": "35-45 years",
        //   "icon": Icons.bus_alert,
        // },
        // {
        //   "text": "45-55 years",
        //   "icon": Icons.bus_alert,
        // },
        // {
        //   "text": "55-65 years",
        //   "icon": Icons.bus_alert,
        // },
        // {
        //   "text": "Over 65 years",
        //   "icon": Icons.bus_alert,
        // },
      ]
    },
    {
      "question": "Which country are you located in ?",
      "answers": [
        {
          "text": "12-17 years",
          "icon": Icons.schedule,
        },
      ]
    }
  ];

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }

  void _previusPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width * 0.95,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue, // Background color
                    radius: 20, // Adjust radius for size
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white, // Arrow color
                        size: 18, // Adjust size of the icon
                      ),
                      onPressed: () {
                        _previusPage();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ProgressBar(),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: questions.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return QuestionPage(
                      question: questions[index]["question"],
                      answers: questions[index]["answers"],
                      onNext: _nextPage,
                    );
                  },
                ),
              ),
              PrimaryButton(
                text: "Next",
                onPressed: _nextPage,
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
