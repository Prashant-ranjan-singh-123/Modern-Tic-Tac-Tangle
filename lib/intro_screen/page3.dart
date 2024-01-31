import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: HexColor('#0e1531'),
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
                      'assets/peopleVsRobot.json',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      reverse: true,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Challenge Computer',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'Kalnia',
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'You Vs Computer',
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
