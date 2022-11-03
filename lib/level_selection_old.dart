import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import 'game_selection.dart';

class LevelSelectionOldPage extends StatefulWidget {
  @override
  LevelSelectionOldView createState() => new LevelSelectionOldView();
}

class LevelSelectionOldView extends State<LevelSelectionOldPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    var width = mediaQueryData.size.width;
    var height = mediaQueryData.size.height;

    print("width: $width");
    print("height: $height");

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
              child: Card(
                margin: EdgeInsets.only(top: 0),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(6.5),
                ),
                child: Container(
                  // height: 370,
                  // width: mediaQueryData.size.width * .8,
                  padding: EdgeInsets.only(
                      top: (mediaQueryData.size.height * .07),
                      left: (mediaQueryData.size.width * .09),
                      right: (mediaQueryData.size.width * .09)),
                  height: mediaQueryData.size.height * .55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => GameSelectionPage(),
                              //   ),
                              // ),
                            },
                            child: Container(
                              width: mediaQueryData.size.width * .2,
                              // height: mediaQueryData.size.width * .2,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/level_number_background.png',
                                        fit: BoxFit.cover,
                                        width: mediaQueryData.size.width * .15,
                                        height: mediaQueryData.size.width * .15,
                                      ),
                                      Positioned(
                                        top: mediaQueryData.size.height * .007,
                                        left: mediaQueryData.size.height * .022,
                                        right: mediaQueryData.size.height * .025,
                                        bottom: mediaQueryData.size.height * .012,
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  mediaQueryData.textScaleFactor *
                                                      60),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: mediaQueryData.size.width * .30,
                                        height: mediaQueryData.size.width * .07,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff45BF55),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              6.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/level_star_three.png',
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
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => GameSelectionPage(),
                              //   ),
                              // ),
                            },
                            child: Container(
                              width: mediaQueryData.size.width * .2,
                              // height: mediaQueryData.size.width * .2,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/level_number_background.png',
                                        fit: BoxFit.cover,
                                        width: mediaQueryData.size.width * .15,
                                        height: mediaQueryData.size.width * .15,
                                      ),
                                      Positioned(
                                        top: mediaQueryData.size.height * .007,
                                        left: mediaQueryData.size.height * .022,
                                        right: mediaQueryData.size.height * .025,
                                        bottom: mediaQueryData.size.height * .012,
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              mediaQueryData.textScaleFactor *
                                                  60),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: mediaQueryData.size.width * .30,
                                        height: mediaQueryData.size.width * .07,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff45BF55),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              6.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/level_star_one.png',
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
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => GameSelectionPage(),
                              //   ),
                              // ),
                            },
                            child: Container(
                              width: mediaQueryData.size.width * .2,
                              // height: mediaQueryData.size.width * .2,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/level_number_background.png',
                                        fit: BoxFit.cover,
                                        width: mediaQueryData.size.width * .15,
                                        height: mediaQueryData.size.width * .15,
                                      ),
                                      Positioned(
                                        top: mediaQueryData.size.height * .007,
                                        left: mediaQueryData.size.height * .022,
                                        right: mediaQueryData.size.height * .025,
                                        bottom: mediaQueryData.size.height * .012,
                                        child: Text(
                                          "3",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              mediaQueryData.textScaleFactor *
                                                  60),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: mediaQueryData.size.width * .30,
                                        height: mediaQueryData.size.width * .07,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff45BF55),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              6.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/level_star_two.png',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => GameSelectionPage(),
                              //   ),
                              // ),
                            },
                            child: Container(
                              width: mediaQueryData.size.width * .2,
                              // height: mediaQueryData.size.width * .2,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/level_number_background.png',
                                        fit: BoxFit.cover,
                                        width: mediaQueryData.size.width * .15,
                                        height: mediaQueryData.size.width * .15,
                                      ),
                                      Positioned(
                                        top: mediaQueryData.size.height * .007,
                                        left: mediaQueryData.size.height * .022,
                                        right: mediaQueryData.size.height * .025,
                                        bottom: mediaQueryData.size.height * .012,
                                        child: Text(
                                          "4",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              mediaQueryData.textScaleFactor *
                                                  60),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: mediaQueryData.size.width * .30,
                                        height: mediaQueryData.size.width * .07,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff45BF55),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              6.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/level_star_three.png',
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
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => GameSelectionPage(),
                              //   ),
                              // ),
0                            },
                            child: Container(
                              width: mediaQueryData.size.width * .2,
                              // height: mediaQueryData.size.width * .2,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/level_number_background.png',
                                        fit: BoxFit.cover,
                                        width: mediaQueryData.size.width * .15,
                                        height: mediaQueryData.size.width * .15,
                                      ),
                                      Positioned(
                                        top: mediaQueryData.size.height * .007,
                                        left: mediaQueryData.size.height * .022,
                                        right: mediaQueryData.size.height * .025,
                                        bottom: mediaQueryData.size.height * .012,
                                        child: Text(
                                          "5",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              mediaQueryData.textScaleFactor *
                                                  60),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: mediaQueryData.size.width * .30,
                                        height: mediaQueryData.size.width * .07,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff45BF55),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              6.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/level_star_two.png',
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
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => GameSelectionPage(),
                              //   ),
                              // ),
                            },
                            child: Container(
                              width: mediaQueryData.size.width * .2,
                              // height: mediaQueryData.size.width * .2,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/level_number_background.png',
                                        fit: BoxFit.cover,
                                        width: mediaQueryData.size.width * .15,
                                        height: mediaQueryData.size.width * .15,
                                      ),
                                      Positioned(
                                        top: mediaQueryData.size.height * .007,
                                        left: mediaQueryData.size.height * .022,
                                        right: mediaQueryData.size.height * .025,
                                        bottom: mediaQueryData.size.height * .012,
                                        child: Text(
                                          "6",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              mediaQueryData.textScaleFactor *
                                                  60),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: mediaQueryData.size.width * .30,
                                        height: mediaQueryData.size.width * .07,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff45BF55),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              6.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/level_star_three.png',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => GameSelectionPage(),
                              //   ),
                              // ),
                            },
                            child: Container(
                              width: mediaQueryData.size.width * .2,
                              // height: mediaQueryData.size.width * .2,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/level_number_background.png',
                                        fit: BoxFit.cover,
                                        width: mediaQueryData.size.width * .15,
                                        height: mediaQueryData.size.width * .15,
                                      ),
                                      Positioned(
                                        top: mediaQueryData.size.height * .007,
                                        left: mediaQueryData.size.height * .022,
                                        right: mediaQueryData.size.height * .025,
                                        bottom: mediaQueryData.size.height * .012,
                                        child: Text(
                                          "7",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              mediaQueryData.textScaleFactor *
                                                  60),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: mediaQueryData.size.width * .30,
                                        height: mediaQueryData.size.width * .07,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff45BF55),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              6.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/level_star_one.png',
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
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => GameSelectionPage(),
                              //   ),
                              // ),
                            },
                            child: Container(
                              width: mediaQueryData.size.width * .2,
                              // height: mediaQueryData.size.width * .2,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/level_number_background.png',
                                        fit: BoxFit.cover,
                                        width: mediaQueryData.size.width * .15,
                                        height: mediaQueryData.size.width * .15,
                                      ),
                                      Positioned(
                                        top: mediaQueryData.size.height * .007,
                                        left: mediaQueryData.size.height * .022,
                                        right: mediaQueryData.size.height * .025,
                                        bottom: mediaQueryData.size.height * .012,
                                        child: Text(
                                          "8",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              mediaQueryData.textScaleFactor *
                                                  60),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: mediaQueryData.size.width * .30,
                                        height: mediaQueryData.size.width * .07,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff45BF55),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              6.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/level_star_two.png',
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
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => GameSelectionPage(),
                              //   ),
                              // ),
                            },
                            child: Container(
                              width: mediaQueryData.size.width * .2,
                              // height: mediaQueryData.size.width * .2,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/level_number_background.png',
                                        fit: BoxFit.cover,
                                        width: mediaQueryData.size.width * .15,
                                        height: mediaQueryData.size.width * .15,
                                      ),
                                      Positioned(
                                        top: mediaQueryData.size.height * .007,
                                        left: mediaQueryData.size.height * .022,
                                        right: mediaQueryData.size.height * .025,
                                        bottom: mediaQueryData.size.height * .012,
                                        child: Text(
                                          "9",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              mediaQueryData.textScaleFactor *
                                                  60),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: mediaQueryData.size.width * .30,
                                        height: mediaQueryData.size.width * .07,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff45BF55),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              6.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/level_star_one.png',
                                          ),
                                        ),
                                      ),
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
                ),
              ),
            ),
            Positioned(
              // top: 130,
              // left: 70,
              // right: 70,
              top: mediaQueryData.size.height * .16,
              left: mediaQueryData.size.width * .15,
              right: mediaQueryData.size.width * .15,
              child: Card(
                margin:
                    EdgeInsets.only(top: (mediaQueryData.size.height * .035)),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(6.5),
                ),
                child: Container(
                  // height: 65,
                  // width: mediaQueryData.size.width * .6,
                  height: mediaQueryData.size.height * .08,
                  decoration: BoxDecoration(
                    color: const Color(0xff45BF55),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        6.5,
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "LEVEL SELECT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: mediaQueryData.textScaleFactor * 48,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
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
}
