import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/Screen1Lottie.json',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      reverse: true,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Welcome To Game',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'Kalnia',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Tic Tac Tangle',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'Lobster',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
