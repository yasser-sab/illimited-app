import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/data/questions.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/progress_bar.dart';
import 'package:illimited_app/widget/question_page.dart';
import 'package:illimited_app/widget/single_choice_selector.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  final soundPlayer = AudioPlayer();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _currentReachedPage = 0;
  double _percentage = 0;
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    soundPlayer.setAsset(           // Load a URL
    'assets/sounds/congratulation.mp3');  
  }

  @override
  void dispose() {
    soundPlayer.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage == questions.length - 1 &&
        context.read<QuestionProvider>().answers[_currentPage] != "") {
      setState(() {
        isFinished = true;
        getPercentage();
      });
      soundPlayer.play();
      pushAuth();
    }

    if (_currentPage < questions.length - 1) {
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
    if (_currentReachedPage < _currentPage) {
      _currentReachedPage = _currentPage;
      setState(() {
        getPercentage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _questionProvider =
        Provider.of<QuestionProvider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: _currentPage == 0
                            ? Colors.grey
                            : Colors.blue, // Background color
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
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: ProgressBar(
                          percent: _percentage,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: questions.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return QuestionPage(
                            questionIndex: index,
                            question: questions[index]["question"],
                            answers: questions[index]["answers"],
                          );
                        },
                      ),
                    ),
                  ),
                  PrimaryButton(
                    enabled: _questionProvider.answers[_currentPage] != "",
                    text:
                        _currentPage == questions.length - 1 ? "Done" : "Next",
                    onPressed: _nextPage,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isFinished,
            child: Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Lottie.asset(
                "assets/lottie/congratz2.json",
                repeat: false,
              ),
            ),
          ),
        ],
      )),
    );
  }

  getPercentage() {
    int answeredQuestions = context
        .read<QuestionProvider>()
        .answers
        .where((answer) => answer != "")
        .length;
    int nbQestions = questions.length;

    if (answeredQuestions == 0) {
      _percentage = 0;
    } else {
      double percentage = (answeredQuestions / nbQestions) * 100;
      setState(() {
        _percentage = percentage;
      });
    }
  }

  void pushAuth() async {
    await Future.delayed(
      const Duration(milliseconds: 3000),
    );
    context.goNamed(RouteNames.signin);
  }
}
