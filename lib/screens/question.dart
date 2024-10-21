import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/data/questions.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/services/notification_service.dart';
import 'package:illimited_app/services/user_repository.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/progress_bar.dart';
import 'package:illimited_app/widget/question_page.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  int questionLenght = 0;

  @override
  void initState() {
    super.initState();
    soundPlayer.setAsset(// Load a URL
        'assets/sounds/congratulation.mp3');
  }

  @override
  void dispose() {
    soundPlayer.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage == questions["en"]!.length - 1 &&
        context.read<QuestionProvider>().answers[_currentPage] != "") {
      var userData = {
        "age": context.read<QuestionProvider>().answers[2],
        "country": context.read<QuestionProvider>().answers[3],
        "gender": context.read<QuestionProvider>().answers[0],
        "improvement_preference": context.read<QuestionProvider>().answers[1],
        "isQuestionsAnswered": true,
        // "task_progress": []
      };

      UserRepository().update(userData).then((value) {
        log("USER UPDATED!");
        // schedule task reminder notification if not finished

      }).catchError((onError) {
        log("error while updating user !!");
      });

      setState(() {
        isFinished = true;
        getPercentage();
      });
      soundPlayer.play();
      pushAuth();
    }

    if (_currentPage < questions["en"]!.length - 1) {
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
        Locale currentLocale = Localizations.localeOf(context);
    String languageCode = currentLocale.languageCode;
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
                          icon: const Icon(
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
                        itemCount: questions["en"]!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return QuestionPage(
                            questionIndex: index,
                            question: questions["$languageCode"]![index]["question"],
                            answers: questions["$languageCode"]![index]["answers"],
                            type: questions["$languageCode"]![index]["type"],
                          );
                        },
                      ),
                    ),
                  ),
                  PrimaryButton(
                    isBold: true,
                    enabled: _questionProvider.answers[_currentPage] != "",
                    text:
                        _currentPage == questions["en"]!.length - 1 ? AppLocalizations.of(context)!.done : AppLocalizations.of(context)!.next,
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
    int nbQestions = questions["en"]!.length;

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
    context.goNamed(RouteNames.introVideo);
  }
}
