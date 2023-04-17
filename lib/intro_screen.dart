import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intro_app/homepage.dart';
import 'package:intro_app/intro/intro_page_1.dart';
import 'package:intro_app/intro/intro_page_2.dart';
import 'package:intro_app/intro/intro_page_3.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<Widget> pages = [
    IntroPageOne(),
    IntroPageTwo(),
    IntroPageThree(),
  ];

  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentIndex < pages.length - 1) {
        _currentIndex++;
      } else {
        if (_currentIndex == 2) {
          timer.cancel();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: pages,
      ),
    );
  }
}
