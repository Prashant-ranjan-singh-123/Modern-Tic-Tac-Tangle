import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_final/AskingPage.dart';
import 'package:tic_tac_toe_final/on_board_screen.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String str = "Tic Tac Toe";
  String background = "#0e1531";
  String gameCardShadding = "#49554b";
  String containerBackground = "#684dfc";
  String fontColor = "#000000";
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const OnBoardScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: HexColor(background),
        child: Center(
            child: Container(
          width: 170,
          height: 140,
          decoration: BoxDecoration(
              color: HexColor(containerBackground),
              border: Border.all(
                  color: Colors.black,
                  width: 2
              ),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: HexColor(gameCardShadding),
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 1,
                  blurRadius: 40
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/Animation - 1705409653545.json',
                  width: 150, height: 90, reverse: true),
              Text(str,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: HexColor(fontColor))),
            ],
          ),
        )),
      ),
    );
  }
}
