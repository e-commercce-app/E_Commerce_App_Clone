import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // page Controller .
  PageController pageController = PageController();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {},
        scrollDirection: Axis.horizontal,
        children: [
          Container(color: Colors.green),
          Container(color: Colors.orange),
          Container(color: Colors.blue),
        ],
      ),
    );
  }
}
