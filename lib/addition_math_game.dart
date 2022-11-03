import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:ui' as ui;

import 'game_selection.dart';
import 'level_selection.dart';

class AdditionMathGamePage extends StatefulWidget {

  int difficulty, noOfQuestions;

  AdditionMathGamePage(
      {Key key,
        @required this.difficulty,
        @required this.noOfQuestions,})
      : super(key: key);

  @override
  MathGameView createState() => new MathGameView(difficulty, noOfQuestions);
}

class MathGameView extends State<AdditionMathGamePage> {

  MathGameView(this.difficulty, this.noOfQuestions);

  int difficulty, noOfQuestions, currentQuestion = 0, correctAnswers = 0, skipped = 0;
  int numberOne, numberTwo, choiceOne, choiceTwo, choiceThree, choiceFour, answerChoice;
  bool someAnswerSelected = false, answerChoiceOne = false, answerChoiceTwo = false, answerChoiceThree = false, answerChoiceFour = false, showDefault = true, showAnimation = false;
  bool hideChoiceOne = false, hideChoiceTwo = false, hideChoiceThree = false, hideChoiceFour = false;
  Timer _countDownQuestionTimer, _nextQuestionCountDownTimer;
  int _countDownTimer = 10;
  int _nextQuestionTimer = 1;

  int _numberOfCoins = 0;

  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() {
    getCoinsValue().then((value) {
      setState(() {
        _numberOfCoins = value;
      });
    });
    generateQuestion();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffF1F1F1),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              // width: 412,
              // height: 896,
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height,
              child: Image.asset(
                showAnimation ? 'assets/images/correct_answer_anim.gif' : 'assets/images/game_background.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: mediaQueryData.size.height * .045,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: mediaQueryData.size.width * .07,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => {
                          resetGame(),
                        },
                        child: Image.asset(
                          'assets/images/question_reset.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/coins_background.png',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: mediaQueryData.size.width * .035,
                            left: mediaQueryData.size.width * .12,
                            right: mediaQueryData.size.width * .05,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "$_numberOfCoins",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaQueryData.size.height * .015,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: mediaQueryData.size.width * .07,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => LevelSelectionPage(),
                              ),
                              (e) => false),
                        },
                        child: Image.asset(
                          'assets/images/home_button.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/timer_background.png',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: mediaQueryData.size.width * .035,
                            left: mediaQueryData.size.width * .12,
                            right: mediaQueryData.size.width * .05,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "$_countDownTimer",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaQueryData.size.height * .015,
                ),
                Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/question_count_background.png',
                      fit: BoxFit.cover,
                      width: mediaQueryData.size.width * .86,
                      height: mediaQueryData.size.height * .065,
                    ),
                    Positioned(
                      top: mediaQueryData.size.height * .015,
                      left: mediaQueryData.size.height * .022,
                      right: mediaQueryData.size.height * .022,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Question $currentQuestion of $noOfQuestions",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQueryData.size.height * .015,
                ),
                Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/question_background.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: mediaQueryData.size.height * .16,
                      left: mediaQueryData.size.height * .022,
                      right: mediaQueryData.size.height * .025,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "$numberOne + $numberTwo = ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 40),
                        ),
                      ),
                    ),
                    Positioned(
                      top: mediaQueryData.size.width * .22,
                      right: mediaQueryData.size.height * .03,
                      child: GestureDetector(
                        onTap: () => {
                          if (_countDownQuestionTimer != null)
                            _countDownQuestionTimer.cancel(),
                        // setState(() {
                        if (_numberOfCoins > 1) {
                          _showHintsDialog(),
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(milliseconds: 1900),
                                  content:
                                      Text('Not enough coins available!!!'),
                                ),
                              ),
                              _nextQuestionTimer = 2,
                              _nextQuestionCountDownTimer = new Timer.periodic(
                                Duration(seconds: 1),
                                (Timer timer) {
                                  if (_nextQuestionTimer == 0) {
                                    _nextQuestionCountDownTimer.cancel();
                                    _nextQuestionTimer = 1;
                                    startQuestionCountDownTimer(_countDownTimer);
                                  } else {
                                    _nextQuestionTimer--;
                                  }
                                },
                              ),
                            }
                        },
                        child: Image.asset(
                          'assets/images/question_info.png',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQueryData.size.height * .015,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: mediaQueryData.size.width * .13,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          if (!hideChoiceOne)
                            GestureDetector(
                              onTap: () => {
                                selectedAnswer(1),
                              },
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    showDefault
                                        ? 'assets/images/answer_options_back.png'
                                        : answerChoiceOne
                                            ? 'assets/images/correct_answer_back.png'
                                            : 'assets/images/wrong_answer_back.png',
                                    fit: BoxFit.cover,
                                    width: mediaQueryData.size.width * .30,
                                    height: mediaQueryData.size.width * .14,
                                  ),
                                  Positioned(
                                    top: mediaQueryData.size.height * .015,
                                    left: mediaQueryData.size.height * .022,
                                    right: mediaQueryData.size.height * .025,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "$choiceOne",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (!hideChoiceTwo)
                            GestureDetector(
                              onTap: () => {
                                selectedAnswer(2),
                              },
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    showDefault
                                        ? 'assets/images/answer_options_back.png'
                                        : answerChoiceTwo
                                            ? 'assets/images/correct_answer_back.png'
                                            : 'assets/images/wrong_answer_back.png',
                                    fit: BoxFit.cover,
                                    width: mediaQueryData.size.width * .30,
                                    height: mediaQueryData.size.width * .14,
                                  ),
                                  Positioned(
                                    top: mediaQueryData.size.height * .015,
                                    left: mediaQueryData.size.height * .022,
                                    right: mediaQueryData.size.height * .025,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "$choiceTwo",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: mediaQueryData.size.height * .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          if (!hideChoiceThree)
                            GestureDetector(
                              onTap: () => {
                                selectedAnswer(3),
                              },
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    showDefault
                                        ? 'assets/images/answer_options_back.png'
                                        : answerChoiceThree
                                            ? 'assets/images/correct_answer_back.png'
                                            : 'assets/images/wrong_answer_back.png',
                                    fit: BoxFit.cover,
                                    width: mediaQueryData.size.width * .30,
                                    height: mediaQueryData.size.width * .14,
                                  ),
                                  Positioned(
                                    top: mediaQueryData.size.height * .015,
                                    left: mediaQueryData.size.height * .022,
                                    right: mediaQueryData.size.height * .025,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "$choiceThree",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (!hideChoiceFour)
                            GestureDetector(
                              onTap: () => {
                                selectedAnswer(4),
                              },
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    showDefault
                                        ? 'assets/images/answer_options_back.png'
                                        : answerChoiceFour
                                            ? 'assets/images/correct_answer_back.png'
                                            : 'assets/images/wrong_answer_back.png',
                                    fit: BoxFit.cover,
                                    width: mediaQueryData.size.width * .30,
                                    height: mediaQueryData.size.width * .14,
                                  ),
                                  Positioned(
                                    top: mediaQueryData.size.height * .015,
                                    left: mediaQueryData.size.height * .022,
                                    right: mediaQueryData.size.height * .025,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "$choiceFour",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaQueryData.size.height * .015,
                ),
                GestureDetector(
                  onTap: () => {
                    if (_countDownQuestionTimer != null)
                      _countDownQuestionTimer.cancel(),
                    if (_nextQuestionCountDownTimer != null)
                      _nextQuestionCountDownTimer.cancel(),
                    if ((_numberOfCoins - 50) < 0)
                      {
                        _numberOfCoins = 0,
                      }
                    else
                      {
                        _numberOfCoins = _numberOfCoins - 50,
                      },
                    saveCoinsValue(_numberOfCoins),
                    generateQuestion(),
                  },
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/skip_background.png',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: mediaQueryData.size.height * .012,
                        left: mediaQueryData.size.height * .022,
                        right: mediaQueryData.size.height * .025,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void startQuestionCountDownTimer(int countDownTimer) {
    _countDownTimer = countDownTimer;
    const oneSec = const Duration(seconds: 1);
    _countDownQuestionTimer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_countDownTimer == 0) {
          timer.cancel();
          generateQuestion();
        } else {
          setState(() {
            _countDownTimer--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    if (_countDownQuestionTimer != null)
      _countDownQuestionTimer.cancel();
    if (_nextQuestionCountDownTimer != null)
      _nextQuestionCountDownTimer.cancel();
    super.dispose();
  }

  void generateQuestion() {
    if (currentQuestion < noOfQuestions) {
      setState(() {
        if (!someAnswerSelected)
          skipped++;
        currentQuestion++;
        Random random = new Random();
        answerChoiceOne = false;
        answerChoiceTwo = false;
        answerChoiceTwo = false;
        answerChoiceFour = false;
        someAnswerSelected = false;
        showDefault = true;
        showAnimation = false;
        hideChoiceOne = false;
        hideChoiceTwo = false;
        hideChoiceThree = false;
        hideChoiceFour = false;

        if (difficulty == 1) {
          numberOne = random.nextInt(9) + 1;
          numberTwo = random.nextInt(9) + 1;

          answerChoice = random.nextInt(4) + 1;
          if (answerChoice == 1) {
            choiceOne = numberOne + numberTwo;
            do {
              choiceTwo = (random.nextInt(19) + 1);
            } while (choiceTwo == choiceOne);

            do {
              choiceThree = (random.nextInt(19) + 1);
            } while (choiceThree == choiceOne || choiceThree == choiceTwo);

            do {
              choiceFour = (random.nextInt(19) + 1);
            } while (choiceFour == choiceOne || choiceFour == choiceTwo ||
                choiceFour == choiceThree);
          } else if (answerChoice == 2) {
            choiceTwo = numberOne + numberTwo;
            do {
              choiceOne = (random.nextInt(19) + 1);
            } while (choiceOne == choiceTwo);

            do {
              choiceThree = (random.nextInt(19) + 1);
            } while (choiceThree == choiceOne || choiceThree == choiceTwo);

            do {
              choiceFour = (random.nextInt(19) + 1);
            } while (choiceFour == choiceOne || choiceFour == choiceTwo ||
                choiceFour == choiceThree);
          } else if (answerChoice == 3) {
            choiceThree = numberOne + numberTwo;
            do {
              choiceOne = (random.nextInt(19) + 1);
            } while (choiceOne == choiceThree);

            do {
              choiceTwo = (random.nextInt(19) + 1);
            } while (choiceTwo == choiceOne || choiceTwo == choiceThree);

            do {
              choiceFour = (random.nextInt(19) + 1);
            } while (choiceFour == choiceOne || choiceFour == choiceTwo ||
                choiceFour == choiceThree);
          } else if (answerChoice == 4) {
            choiceFour = numberOne + numberTwo;
            do {
              choiceOne = (random.nextInt(19) + 1);
            } while (choiceOne == choiceFour);

            do {
              choiceTwo = (random.nextInt(19) + 1);
            } while (choiceTwo == choiceOne || choiceTwo == choiceFour);

            do {
              choiceThree = (random.nextInt(9) + 1);
            } while (choiceThree == choiceOne || choiceThree == choiceTwo ||
                choiceThree == choiceFour);
          }
        } else if (difficulty == 2) {
          numberOne = random.nextInt(99) + 1;
          numberTwo = random.nextInt(99) + 1;

          answerChoice = random.nextInt(4) + 1;
          if (answerChoice == 1) {
            choiceOne = numberOne + numberTwo;
            do {
              choiceTwo = (random.nextInt(199) + 1);
            } while (choiceTwo == choiceOne);

            do {
              choiceThree = (random.nextInt(199) + 1);
            } while (choiceThree == choiceOne || choiceThree == choiceTwo);

            do {
              choiceFour = (random.nextInt(199) + 1);
            } while (choiceFour == choiceOne || choiceFour == choiceTwo ||
                choiceFour == choiceThree);
          } else if (answerChoice == 2) {
            choiceTwo = numberOne + numberTwo;
            do {
              choiceOne = (random.nextInt(199) + 1);
            } while (choiceOne == choiceTwo);

            do {
              choiceThree = (random.nextInt(199) + 1);
            } while (choiceThree == choiceOne || choiceThree == choiceTwo);

            do {
              choiceFour = (random.nextInt(199) + 1);
            } while (choiceFour == choiceOne || choiceFour == choiceTwo ||
                choiceFour == choiceThree);
          } else if (answerChoice == 3) {
            choiceThree = numberOne + numberTwo;
            do {
              choiceOne = (random.nextInt(199) + 1);
            } while (choiceOne == choiceThree);

            do {
              choiceTwo = (random.nextInt(199) + 1);
            } while (choiceTwo == choiceOne || choiceTwo == choiceThree);

            do {
              choiceFour = (random.nextInt(199) + 1);
            } while (choiceFour == choiceOne || choiceFour == choiceTwo ||
                choiceFour == choiceThree);
          } else if (answerChoice == 4) {
            choiceFour = numberOne + numberTwo;
            do {
              choiceOne = (random.nextInt(199) + 1);
            } while (choiceOne == choiceFour);

            do {
              choiceTwo = (random.nextInt(199) + 1);
            } while (choiceTwo == choiceOne || choiceTwo == choiceFour);

            do {
              choiceThree = (random.nextInt(199) + 1);
            } while (choiceThree == choiceOne || choiceThree == choiceTwo ||
                choiceThree == choiceFour);
          }
        } else if (difficulty == 3) {
          numberOne = random.nextInt(999) + 1;
          numberTwo = random.nextInt(999) + 1;

          answerChoice = random.nextInt(4) + 1;
          if (answerChoice == 1) {
            choiceOne = numberOne + numberTwo;
            do {
              choiceTwo = (random.nextInt(1999) + 1);
            } while (choiceTwo == choiceOne);

            do {
              choiceThree = (random.nextInt(1999) + 1);
            } while (choiceThree == choiceOne || choiceThree == choiceTwo);

            do {
              choiceFour = (random.nextInt(1999) + 1);
            } while (choiceFour == choiceOne || choiceFour == choiceTwo ||
                choiceFour == choiceThree);
          } else if (answerChoice == 2) {
            choiceTwo = numberOne + numberTwo;
            do {
              choiceOne = (random.nextInt(1999) + 1);
            } while (choiceOne == choiceTwo);

            do {
              choiceThree = (random.nextInt(1999) + 1);
            } while (choiceThree == choiceOne || choiceThree == choiceTwo);

            do {
              choiceFour = (random.nextInt(199) + 1);
            } while (choiceFour == choiceOne || choiceFour == choiceTwo ||
                choiceFour == choiceThree);
          } else if (answerChoice == 3) {
            choiceThree = numberOne + numberTwo;
            do {
              choiceOne = (random.nextInt(1999) + 1);
            } while (choiceOne == choiceThree);

            do {
              choiceTwo = (random.nextInt(1999) + 1);
            } while (choiceTwo == choiceOne || choiceTwo == choiceThree);

            do {
              choiceFour = (random.nextInt(1999) + 1);
            } while (choiceFour == choiceOne || choiceFour == choiceTwo ||
                choiceFour == choiceThree);
          } else if (answerChoice == 4) {
            choiceFour = numberOne + numberTwo;
            do {
              choiceOne = (random.nextInt(1999) + 1);
            } while (choiceOne == choiceFour);

            do {
              choiceTwo = (random.nextInt(1999) + 1);
            } while (choiceTwo == choiceOne || choiceTwo == choiceFour);

            do {
              choiceThree = (random.nextInt(1999) + 1);
            } while (choiceThree == choiceOne || choiceThree == choiceTwo ||
                choiceThree == choiceFour);
          }
        }

        startQuestionCountDownTimer(10);
      });
    } else {
      _showCompletionsDialog();
    }
  }

  _showCompletionsDialog() async {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    int wrongAnswers = (noOfQuestions - correctAnswers) - skipped;

    if (wrongAnswers < 0)
      wrongAnswers = wrongAnswers * -1;

    await showDialog<String>(
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              content: Container(
                height: mediaQueryData.size.height * .20,
                child: Column(
                  children: [
                    Text(
                      'All questions attempted, \nTotal questions: $noOfQuestions \nCorrect answers: $correctAnswers\n Wrong answers: $wrongAnswers\n Skipped/Time-up: $skipped',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: mediaQueryData.textScaleFactor * 25,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                new ElevatedButton(
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      color: Color(0xffe2923f),
                    ),
                  ),
                  onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).pop();
                  },
                )
              ],
            );
          }), context: context,
      barrierDismissible: false,
    );
  }

  _showHintsDialog() async {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    int wrongAnswers = (noOfQuestions - correctAnswers) - skipped;

    if (wrongAnswers < 0)
      wrongAnswers = wrongAnswers * -1;

    await showDialog<String>(
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.5),
                ),
                // backgroundColor: Color(ColorRes.BLACK_ALPHA_65),
                child: Container(
                  width: mediaQueryData.size.width * .8,
                  height: mediaQueryData.size.height * .45,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.5),
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: mediaQueryData.size.height * .04,
                        left: mediaQueryData.size.width * .01,
                        right: mediaQueryData.size.width * .01,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: mediaQueryData.size.width * 0),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            height: mediaQueryData.size.height * .40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.5),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: mediaQueryData.size.height * .05,
                                ),
                                GestureDetector(
                              onTap: () => {
                                  _numberOfCoins = _numberOfCoins - 1,
                                  saveCoinsValue(_numberOfCoins),
                                  if (answerChoice == 1) {
                                    hideChoiceOne = false,
                                    hideChoiceTwo = true,
                                    hideChoiceThree = true,
                                    hideChoiceFour = false,
                                  } else if (answerChoice == 2) {
                                    hideChoiceOne = true,
                                    hideChoiceTwo = false,
                                    hideChoiceThree = false,
                                    hideChoiceFour = true,
                                  } else if (answerChoice == 3) {
                                    hideChoiceOne = false,
                                    hideChoiceTwo = true,
                                    hideChoiceThree = false,
                                    hideChoiceFour = true,
                                  } else if (answerChoice == 4) {
                                    hideChoiceOne = true,
                                    hideChoiceTwo = false,
                                    hideChoiceThree = true,
                                    hideChoiceFour = false,
                                  },
                                  Navigator.pop(context),
                                startQuestionCountDownTimer(_countDownTimer),
                              },
                              child: Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/questions_ten.png',
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        top: mediaQueryData.size.height * .025,
                                        left: mediaQueryData.size.height * .060,
                                        right: mediaQueryData.size.height * .005,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Fifty Fifty",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 39),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }), context: context,
      barrierDismissible: false,
    );
  }

  void resetGame() {

    if (_countDownQuestionTimer != null)
      _countDownQuestionTimer.cancel();
    if (_nextQuestionCountDownTimer != null)
      _nextQuestionCountDownTimer.cancel();

    currentQuestion = 0;
    correctAnswers = 0;
    skipped = 0;
    someAnswerSelected = false;
    showDefault = true;
    showAnimation = false;
    _countDownTimer = 10;
    _nextQuestionTimer = 1;

    generateQuestion();
  }

  void selectedAnswer (int selected) {
    setState(() {

      if (answerChoice == selected) {
        correctAnswers++;
        _numberOfCoins = _numberOfCoins + 100;
        saveCoinsValue(_numberOfCoins);
        showAnimation = true;
      } else {
        if ((_numberOfCoins - 50) < 0) {
          _numberOfCoins = 0;
        } else {
          _numberOfCoins = _numberOfCoins - 50;
        }
        saveCoinsValue(_numberOfCoins);
      }

      someAnswerSelected = true;

      if (answerChoice == 1) {
        answerChoiceOne = true;
        answerChoiceTwo = false;
        answerChoiceThree = false;
        answerChoiceFour = false;
        showDefault = false;
      } else if (answerChoice == 2) {
        answerChoiceOne = false;
        answerChoiceTwo = true;
        answerChoiceThree = false;
        answerChoiceFour = false;
        showDefault = false;
      } else if (answerChoice == 3) {
        answerChoiceOne = false;
        answerChoiceTwo = false;
        answerChoiceThree = true;
        answerChoiceFour = false;
        showDefault = false;
      } else if (answerChoice == 4) {
        answerChoiceOne = false;
        answerChoiceTwo = false;
        answerChoiceThree = false;
        answerChoiceFour = true;
        showDefault = false;
      }
    });

    _countDownQuestionTimer.cancel();
    const oneSec = const Duration(seconds: 1);
    _nextQuestionCountDownTimer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_nextQuestionTimer == 0) {
          _nextQuestionCountDownTimer.cancel();
          generateQuestion();
          _nextQuestionTimer = 1;
        } else {
          _nextQuestionTimer--;
        }
      },
    );

  }

  Future<int> getCoinsValue() async {
    var pref = await SharedPreferences.getInstance();
    var coins = pref.getInt('coins') ?? 0;
    return coins;
  }

  Future<void> saveCoinsValue(int value) async {
    var pref = await SharedPreferences.getInstance();
    pref.setInt('coins', value);
  }
}