import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class ForthPage extends StatelessWidget {
  const ForthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: HexColor('#be6c45'),
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
                      'assets/Brain.json',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      reverse: false,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Let's Play Game",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'Kalnia',
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'Press done to start',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
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
