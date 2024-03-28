import 'package:aqua_sentry/Screens/Onboarding/page1.dart';
import 'package:aqua_sentry/Screens/Onboarding/page2.dart';
import 'package:aqua_sentry/Screens/Onboarding/page3.dart';
import 'package:aqua_sentry/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoarding(),
    );
  }
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _controller = PageController();
  String buttonText = 'Next';
  String pageText = 'Control your valve, make it easier';
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set background color
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              if (index == 1) {
                setState(() {
                  page = 2;
                  pageText = 'Seamlessly connect your valve';
                  buttonText = 'Next';
                });
              } else if (index == 2) {
                setState(() {
                  page = 3;
                  pageText = 'Save money and reduce water usage';
                  buttonText = 'Get Started';
                });
              } else {
                setState(() {
                  page = 1;
                  pageText = 'Control your valve, make it easier';
                  buttonText = 'Next';
                });
              }
            },
            children: [
             FirstPage(),
              SecondPage(),
              ThirdPage(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 8, 40),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.0),
                    child: Text(
                      pageText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment( -0.6 , 0.6),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 20,
                      dotColor: Colors.white.withOpacity(0.7),
                      activeDotColor: Color(0xFF7CC4FC),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextButton(
                        onPressed: () {
                          _controller.jumpToPage(2);
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black87,
                          backgroundColor: Color(0xFF7CC4FC),
                        ),
                        onPressed: () {
                          page != 3 ? _controller.jumpToPage(page) : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                        child: Text(buttonText),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
