import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tic_tac_toe_final/AskingPage.dart';
import 'package:tic_tac_toe_final/intro_screen/page1.dart';
import 'package:tic_tac_toe_final/intro_screen/page2.dart';
import 'package:tic_tac_toe_final/intro_screen/page3.dart';
import 'package:tic_tac_toe_final/intro_screen/page4.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  PageController _controller = PageController();
  int currentPage = 0;
  bool isLast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              currentPage = index;
              if(index==3) {
                isLast = true;
              }else{
                isLast=false;
              }
              setState(() {});
            },
            children: [
              FirstPage(),
              SecondPage(),
              ThirdPage(),
              ForthPage()
            ],
          ),
          Align(
            alignment: Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isLast ? Text('    ') :
                GestureDetector(
                  onTap:(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AskingPage()));
                },
                  child: Text('Skip',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontFamily: 'Kalnia',
                    ),),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: WormEffect(),
                ),
                isLast ?
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AskingPage()));
                  },
                  child: Text('Done',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontFamily: 'Kalnia',
                    ),
                  ),
                ):
                GestureDetector(
                  onTap: (){
                    _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                  },
                  child: Text('Next',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontFamily: 'Kalnia',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
