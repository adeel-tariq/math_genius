import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import 'game_selection.dart';

class LevelSelectionPage extends StatefulWidget {
  @override
  LevelSelectionView createState() => new LevelSelectionView();
}

class LevelSelectionView extends State<LevelSelectionPage> {
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
                        top: (mediaQueryData.size.height * .05)),
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
              top: mediaQueryData.size.height * .33,
              left: mediaQueryData.size.width * .07,
              right: mediaQueryData.size.width * .07,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'assets/images/selection_background.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: mediaQueryData.size.height * .03,
                    left: mediaQueryData.size.width * .1,
                    right: mediaQueryData.size.width * .1,
                    child: Column(
                      children: <Widget>[
                      SizedBox(
                        height: mediaQueryData.size.height * .02,
                      ),
                      Text(
                        "Select your level\nof difficulty",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 24),
                      ),
                      SizedBox(
                        height: mediaQueryData.size.height * .02,
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => GameSelectionPage(difficulty: 1,),
                            ),
                          ),
                        },
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/beginner_back.png',
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: mediaQueryData.size.height * .028,
                              left: mediaQueryData.size.height * .022,
                              right: mediaQueryData.size.height * .025,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "BEGINNER",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQueryData.size.height * .02,
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => GameSelectionPage(difficulty: 2,),
                            ),
                          ),
                        },
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/intermediate_back.png',
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: mediaQueryData.size.height * .028,
                              left: mediaQueryData.size.height * .022,
                              right: mediaQueryData.size.height * .025,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "INTERMEDIATE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQueryData.size.height * .02,
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => GameSelectionPage(difficulty: 3,),
                            ),
                          ),
                        },
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/expert_back.png',
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: mediaQueryData.size.height * .028,
                              left: mediaQueryData.size.height * .022,
                              right: mediaQueryData.size.height * .025,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "EXPERT",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   top: mediaQueryData.size.height * .21,
            //   left: mediaQueryData.size.width * .15,
            //   right: mediaQueryData.size.width * .15,
            //   child: Stack(
            //     children: <Widget>[
            //       Image.asset(
            //         'assets/images/beginner_back.png',
            //         fit: BoxFit.cover,
            //       ),
            //       Positioned(
            //         top: mediaQueryData.size.height * .015,
            //         left: mediaQueryData.size.height * .015,
            //         right: mediaQueryData.size.height * .015,
            //         child: Align(
            //           alignment: Alignment.center,
            //           child: Text(
            //             "LEVEL SELECT",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.normal,
            //                 fontSize: 32),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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
}
