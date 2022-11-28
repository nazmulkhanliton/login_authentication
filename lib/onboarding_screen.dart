import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //Control to keep track of which page we are on.
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Page View

          PageView(
            controller: _controller,
            children: [
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.cyan,
              ),
              Container(
                color: Colors.amberAccent,
              ),
            ],
          ),

          //Dot Indicator

          Container(
            alignment: const Alignment(0, 0.75),
            child: SmoothPageIndicator(controller: _controller, count: 3),
          )
        ],
      ),
    );
  }
}
