import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_final/UsrVsUsr.dart';

class UsrVsUsrNameScreen extends StatefulWidget {
  const UsrVsUsrNameScreen({super.key});

  @override
  State<UsrVsUsrNameScreen> createState() => _UsrVsUsrStartGameState();
}

class _UsrVsUsrStartGameState extends State<UsrVsUsrNameScreen> {

  @override
  Widget build(BuildContext context) {
    TextEditingController player1TextFiled = TextEditingController();
    TextEditingController player2TextField = TextEditingController();

    void startGameFun() {
      String player1 = player1TextFiled.text.toString();
      String player2 = player2TextField.text.toString();
      player1.trim();
      player2.trim();
      if (player1.isEmpty || player2.isEmpty) {
        showDialog(context: context, builder: (context)=> Dialog(
          child: SizedBox(
            width: 200,
            height: 280,
            child: Column(
              children: [
                Center(
                    child: Lottie.asset('assets/Error.json', repeat: true, width: 90, height: 90, fit:BoxFit.fill)),
                Text("Error", style: TextStyle(
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    color: HexColor('#000'))),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Please supply participant names for the game to proceed. Your cooperation is appreciated.', textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w400,
                  ),),
                ),
                Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(onPressed: (){
                        Navigator.pop((context));
                      }, child: Text("Ok", style: TextStyle(
                        color: Colors.white
                      ),), style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor('#fb2c56')
                      ),),
                    )
                  ],
                )



              ],
            ),
          ),
        ));
      } else {
        player1 = InputTextFieldThings().toUpperCase(player1);
        player2 = InputTextFieldThings().toUpperCase(player2);
        if (InputTextFieldThings().isValidInput(player1) &&
            InputTextFieldThings().isValidInput(player2)) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => UsrVsUsrStartGame(
                        player1Name: player1,
                        player2Name: player2,
                      )));
        } else {
          showDialog(context: context, builder: (context)=> Dialog(
            child: SizedBox(
              width: 200,
              height: 310,
              child: Column(
                children: [
                  Center(
                      child: Lottie.asset('assets/Error.json', repeat: true, width: 90, height: 90, fit:BoxFit.fill)),
                  Text("Error", style: TextStyle(
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: HexColor('#000'))),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Please enter a first name with a maximum of 10 characters, consisting solely of alphabetic characters. Verify the input for accuracy before continuing.',
                      textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400,
                    ),),
                  ),
                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(onPressed: (){
                          Navigator.pop((context));
                        }, child: Text("Ok", style: TextStyle(
                            color: Colors.white
                        ),), style: ElevatedButton.styleFrom(
                            backgroundColor: HexColor('#fb2c56')
                        ),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
        }
      }
    }

    String gameCardShadding = "#49554b";
    String gameCardInnerColor = "#011627";
    String appBarTitle = 'User Vs User';
    String background = "#0e1531";
    String appBarTopColor = "#684dfc";
    String fontColor = "#ffffff";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appBarTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Lobster',
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: HexColor(fontColor))),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [HexColor(background), HexColor(appBarTopColor)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: HexColor(background),
        child: SingleChildScrollView(
          child: Container(
            color: HexColor(background),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90,
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: HexColor(gameCardShadding),
                                    blurStyle: BlurStyle.outer,
                                    spreadRadius: 1,
                                    blurRadius: 40)
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              color: HexColor(gameCardInnerColor)),
                          child: Lottie.asset('assets/Registration.json',
                              reverse: true)),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Text('Enter Player Names',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Kalnia',
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: HexColor(fontColor))),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: HexColor('#000c15'),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0))),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 20),
                              child: Text(
                                'X',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: HexColor(
                                      '#92ff8d',
                                    )),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                child: TextField(
                                  controller: player1TextFiled,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'Kalnia',
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Player 1',
                                      hintStyle: TextStyle(
                                          color: HexColor('#2a2d49'))),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: HexColor('#000c15'),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0))),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 20),
                              child: Text(
                                '0',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: HexColor(
                                      '#684dfc',
                                    )),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                child: TextField(
                                  controller: player2TextField,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'Kalnia',
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Player 2',
                                      hintStyle: TextStyle(
                                          color: HexColor('#2a2d49'))),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        onTap: () {
                          startGameFun();
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            color: HexColor('#866cff'),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Center(
                            child: Text(
                              'Start Game',
                              style: TextStyle(
                                fontFamily: 'Kalnia',
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                color: HexColor('#ffffff'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputTextFieldThings {
  bool isValidInput(String input) {
    if (input.length > 10) {
      return false;
    }
    for (int i = 0; i < input.length; i++) {
      String currentChar = input[i];
      if (!currentChar.contains(RegExp(r'[a-zA-Z]'))) {
        return false;
      }
    }
    return true;
  }

  String toUpperCase(String input) {
    input = input.trim();
    if (input.isNotEmpty) {
      input = input[0].toUpperCase() + input.substring(1).toLowerCase();
    }
    return input;
  }
}