import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:hexcolor/hexcolor.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: HexColor('#684dfc'),
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
                      'assets/peopleVsPeople.json',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      reverse: true,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Challenge Opponent',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'Kalnia',
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'You Vs Opponent',
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
