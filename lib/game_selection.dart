import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_genius/responsive/responsive_helper.dart';
import 'dart:ui' as ui;

import 'addition_math_game.dart';
import 'division_math_game.dart';
import 'multiplication_math_game.dart';
import 'subtraction_math_game.dart';

class GameSelectionPage extends StatefulWidget {
  int difficulty;

  GameSelectionPage({Key key, @required this.difficulty}) : super(key: key);

  @override
  GameSelectionView createState() => new GameSelectionView(difficulty);
}

class GameSelectionView extends State<GameSelectionPage> {
  int difficulty;

  GameSelectionView(this.difficulty);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
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
                'assets/images/app_background.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    // margin: const EdgeInsets.only(top: 24.0),
                    width: mediaQueryData.size.width * .45,
                    margin: EdgeInsets.only(
                        top: (mediaQueryData.size.height * .020)),
                    child: Image.asset(
                      'assets/images/app_logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              // top: 200,
              // left: 20,
              // right: 20,
              top: mediaQueryData.size.height * .24,
              left: mediaQueryData.size.width * .07,
              right: mediaQueryData.size.width * .07,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/selection_background.png',
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => {_showDialog(1)},
                            child: Container(
                              // margin: EdgeInsets.only(
                              //     left: (mediaQueryData.size.width * .04),),
                              width: mediaQueryData.size.width * .28,
                              // height: mediaQueryData.size.width * .5,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Center(
                                      child: Image.asset(
                                        // 'assets/images/addition_game.png',
                                        'assets/images/addition_game.png',
                                        fit: BoxFit.fill,
                                        // width: mediaQueryData.size.width * .010,
                                        // height: mediaQueryData.size.width * .30,
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   color: Colors.amberAccent,
                                  //   height: 20,
                                  // ),

                                  // Container(
                                  //   width: mediaQueryData.size.width * .28,
                                  //   height: mediaQueryData.size.width * .1,
                                  //   decoration: BoxDecoration(
                                  //     color: const Color(0xff98B29B),
                                  //     borderRadius: BorderRadius.all(
                                  //       Radius.circular(
                                  //         6.5,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   child: Text(
                                  //     'Addition',
                                  //     textAlign: TextAlign.center,
                                  //     style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontWeight: FontWeight.normal,
                                  //         fontSize: 22),
                                  //   ),
                                  // ),

                                  Stack(
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          width:
                                              mediaQueryData.size.width * .35,
                                          height:
                                              mediaQueryData.size.width * .1,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff98B29B),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                6.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Container(
                                          width:
                                              mediaQueryData.size.width * .28,
                                          height:
                                              mediaQueryData.size.width * .1,
                                          child: Center(
                                            child: Text(
                                              'Addition',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 22),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => {_showDialog(2)},
                            child: Container(
                              width: mediaQueryData.size.width * .28,
                              // height: mediaQueryData.size.width * .5,
                              child: Column(
                                children: <Widget>[
                                  Center(
                                    child: Image.asset(
                                      'assets/images/subtraction_game.png',
                                      fit: BoxFit.fill,
                                      // width: mediaQueryData.size.width * .010,
                                      // height: mediaQueryData.size.width * .30,
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          width:
                                              mediaQueryData.size.width * .28,
                                          height:
                                              mediaQueryData.size.width * .1,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff98B29B),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                6.5,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Subtraction',
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 22),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Positioned(
                                      //   child: Container(
                                      //     width:
                                      //         mediaQueryData.size.width * .35,
                                      //     height:
                                      //         mediaQueryData.size.width * .1,
                                      //     child: Center(
                                      //       child: Text(
                                      //         'Subtraction',
                                      //         textAlign: TextAlign.center,
                                      //         style: TextStyle(
                                      //             color: Colors.white,
                                      //             fontWeight:
                                      //                 FontWeight.normal,
                                      //             fontSize: 22),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mediaQueryData.size.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => {_showDialog(3)},
                            child: Container(
                              width: mediaQueryData.size.width * .28,
                              // height: mediaQueryData.size.width * .5,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/multiplication_game.png',
                                        fit: BoxFit.fill,
                                        // width: mediaQueryData.size.width * .010,
                                        // height: mediaQueryData.size.width * .30,
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          width:
                                              mediaQueryData.size.width * .35,
                                          height:
                                              mediaQueryData.size.width * .1,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff98B29B),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                6.5,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Multiplication',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 22),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Positioned(
                                      //   child: Container(
                                      //     width:
                                      //         mediaQueryData.size.width * .28,
                                      //     height:
                                      //         mediaQueryData.size.width * .1,
                                      //     child: Center(
                                      //       child: Text(
                                      //         'Multiplication',
                                      //         textAlign: TextAlign.center,
                                      //         style: TextStyle(
                                      //             color: Colors.white,
                                      //             fontWeight:
                                      //                 FontWeight.normal,
                                      //             fontSize: 22),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => {
                              _showDialog(4),
                            },
                            child: Container(
                              width: mediaQueryData.size.width * .28,
                              // height: mediaQueryData.size.width * .5,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/division_game.png',
                                        fit: BoxFit.fill,
                                        // width: mediaQueryData.size.width * .010,
                                        // height: mediaQueryData.size.width * .30,
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          width:
                                              mediaQueryData.size.width * .35,
                                          height:
                                              mediaQueryData.size.width * .1,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff98B29B),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                6.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      Text(
                                        'Division',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 22),
                                      )

                                      // Positioned(
                                      //   child: Container(
                                      //     width:
                                      //         mediaQueryData.size.width * .28,
                                      //     height:
                                      //         mediaQueryData.size.width * .1,
                                      //     child: Center(
                                      //       child: Text(
                                      //         'Division',
                                      //         textAlign: TextAlign.center,
                                      //         style: TextStyle(
                                      //             color: Colors.white,
                                      //             fontWeight:
                                      //                 FontWeight.normal,
                                      //             fontSize: 22),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Positioned(
            //   left: mediaQueryData.size.width * .15,
            //   right: mediaQueryData.size.width * .15,
            //   bottom: mediaQueryData.size.width * .36,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       Image.asset(
            //         'assets/images/back_page.png',
            //         fit: BoxFit.cover,
            //         width: mediaQueryData.size.width * .15,
            //         height: mediaQueryData.size.width * .15,
            //       ),
            //       Image.asset(
            //         'assets/images/next_page.png',
            //         fit: BoxFit.cover,
            //         width: mediaQueryData.size.width * .15,
            //         height: mediaQueryData.size.width * .15,
            //       ),
            //     ],
            //   ),
            // ),
            Positioned(
              top: mediaQueryData.size.height * .21,
              left: mediaQueryData.size.width * .28,
              right: mediaQueryData.size.width * .28,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/game_select_back.png',
                    fit: BoxFit.cover,
                  ),

                  // Adding in Positioned Widget Text no need it cause issues

                  Text(
                    "SELECT\nGAME",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: ResponsiveHelper.isMobile(context) ? 24 : 36),
                  ),

                  // Positioned(
                  //   top: mediaQueryData.size.height * .010,
                  //   left: mediaQueryData.size.height * .010,
                  //   right: mediaQueryData.size.height * .010,
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Text(
                  //       "SELECT\nGAME",
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.normal,
                  //           fontSize: 36),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/app_footer.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(int gameType) async {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    await showDialog<String>(
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27),
            ),
            // backgroundColor: Color(ColorRes.BLACK_ALPHA_65),
            child: Container(
              width: mediaQueryData.size.width * .8,
              height: mediaQueryData.size.height * .45,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                color: Colors.transparent,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: mediaQueryData.size.height * .05,
                    left: mediaQueryData.size.width * .01,
                    right: mediaQueryData.size.width * .01,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: mediaQueryData.size.width * 0),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        height: mediaQueryData.size.height * .40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: mediaQueryData.size.height * .05,
                            ),
                            GestureDetector(
                              onTap: () => {
                                _navigateToGameScreen(context, 10, gameType),
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
                                        "10",
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
                            SizedBox(
                              height: mediaQueryData.size.height * .01,
                            ),
                            GestureDetector(
                              onTap: () => {
                                _navigateToGameScreen(context, 25, gameType),
                              },
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/questions_two_five.png',
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: mediaQueryData.size.height * .025,
                                    left: mediaQueryData.size.height * .060,
                                    right: mediaQueryData.size.height * .005,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "25",
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
                            SizedBox(
                              height: mediaQueryData.size.height * .01,
                            ),
                            GestureDetector(
                              onTap: () => {
                                _navigateToGameScreen(context, 50, gameType),
                              },
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/questions_fifty.png',
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: mediaQueryData.size.height * .025,
                                    left: mediaQueryData.size.height * .060,
                                    right: mediaQueryData.size.height * .005,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "50",
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
                  Positioned(
                    top: mediaQueryData.size.height * .01,
                    left: mediaQueryData.size.width * .16,
                    right: mediaQueryData.size.width * .16,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/expert_back.png',
                          fit: BoxFit.cover,
                        ),

                        Text(
                          "No. of Questions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 24),
                        )

                        // Positioned(
                        //   top: mediaQueryData.size.height * .025,
                        //   left: mediaQueryData.size.height * .01,
                        //   right: mediaQueryData.size.height * .01,
                        //   child: Align(
                        //     alignment: Alignment.center,
                        //     child: Text(
                        //       "No. of Questions",
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.normal,
                        //           fontSize: 24),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: -1,
                    left: mediaQueryData.size.width * .7,
                    child: Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => {
                            Navigator.pop(context),
                          },
                          child: Image.asset(
                            'assets/images/dialog_close.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      context: context,
      barrierDismissible: false,
    );
  }

  _navigateToGameScreen(
      BuildContext context, int noOfQuestions, int gameType) async {
    Navigator.pop(context);
    await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) {
          if (gameType == 1) {
            return AdditionMathGamePage(
              difficulty: difficulty,
              noOfQuestions: noOfQuestions,
            );
          } else if (gameType == 2) {
            return SubtractionMathGamePage(
              difficulty: difficulty,
              noOfQuestions: noOfQuestions,
            );
          } else if (gameType == 3) {
            return MultiplicationMathGamePage(
              difficulty: difficulty,
              noOfQuestions: noOfQuestions,
            );
          } else if (gameType == 4) {
            return DivisionMathGamePage(
              difficulty: difficulty,
              noOfQuestions: noOfQuestions,
            );
          } else {
            return null;
          }
        },
      ),
    );
  }
}
