import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'GameCode.dart';

class UsrVsComStartGame extends StatefulWidget {
  final String player1Name;
  final String player2Name;
  const UsrVsComStartGame(
      {required this.player1Name, required this.player2Name, Key? key})
      : super(key: key);
  @override
  State<UsrVsComStartGame> createState() => _UsrVsComStartGameState();
}

class _UsrVsComStartGameState extends State<UsrVsComStartGame> {
  @override
  void initState() {
    super.initState();
  }

  List<List<int>> gridListSym = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];

  // Grid Symbols
  String grid_0_0_text = '';
  String grid_1_0_text = '';
  String grid_2_0_text = '';
  String grid_0_1_text = '';
  String grid_1_1_text = '';
  String grid_2_1_text = '';
  String grid_0_2_text = '';
  String grid_1_2_text = '';
  String grid_2_2_text = '';

  int CurrTurn = 0;

  // Grid Symbols Color
  String grid_0_0_col = '#92ff8d';
  String grid_1_0_col = '#92ff8d';
  String grid_2_0_col = '#92ff8d';
  String grid_0_1_col = '#92ff8d';
  String grid_1_1_col = '#92ff8d';
  String grid_2_1_col = '#92ff8d';
  String grid_0_2_col = '#92ff8d';
  String grid_1_2_col = '#92ff8d';
  String grid_2_2_col = '#92ff8d';

  // isButton Enable
  bool grid_0_0_enable = true;
  bool grid_1_0_enable = true;
  bool grid_2_0_enable = true;
  bool grid_0_1_enable = true;
  bool grid_1_1_enable = true;
  bool grid_2_1_enable = true;
  bool grid_0_2_enable = true;
  bool grid_1_2_enable = true;
  bool grid_2_2_enable = true;

  int currentRound = 1;
  bool player1Light = true;
  bool player2Light = false;
  int player1TWin = 0;
  int pcTWin = 0;

  @override
  Widget build(BuildContext context) {
    // Total Widget :-
    // Current Round Widget

    // Player 1 Container Widget
    // Player 1 Container (Lottie) Widget
    // Player 1 Container (playerName) Widget
    // Player 1 Container (t Win Widget) Widget
    // Player 1 Container (playerSym) Widget

    // Player 2 Container Widget
    // Player 2 Container (Lottie) Widget
    // Player 2 Container (playerName) Widget
    // Player 2 Container (t Win Widget) Widget
    // Player 2 Container (playerSym) Widget

    // Grid Of TicTacToe Widget
    // TicTacToe Grid [0][0] Widget
    // TicTacToe Grid [1][0] Widget
    // TicTacToe Grid [2][0] Widget

    // TicTacToe Grid [0][1] Widget
    // TicTacToe Grid [1][1] Widget
    // TicTacToe Grid [2][1] Widget

    // TicTacToe Grid [0][2] Widget
    // TicTacToe Grid [1][2] Widget
    // TicTacToe Grid [2][2] Widget

    // Reset Button

    // Colors
    String background = "#0e1531";
    String gridHashColor = '#9ba9b2';
    String containerBackground = "#2b3566";
    String appBarTopColor = "#684dfc";
    String fontColor = "#ffffff";
    String gameCardShadding = "#49554b";
    String xSymbolColor = "#92ff8d";
    String OSymbolColor = "#684dfc";
    String resetButText = 'Restart Game';

    // Lottie Animation Files
    String lottiePlayer1 = 'assets/peopleVsPeople.json';
    String lottiePlayer2 = 'assets/peopleVsRobot.json';

    String player1Sym = 'X';
    String player2Sym = 'O';

    // App Bar
    String appBarTitle = '${widget.player1Name} Vs ${widget.player2Name}';

    // Other Stuff
    String curPlayerSym = "0";
    String curPlayerCol = "$OSymbolColor";

    String Player1Sym = 'X';
    String Player2Sym = '0';

    String currentTerm() {
      if (CurrTurn % 2 == 0) {
        return "x";
      }
      return "0";
    }

    void restartButton() {
      grid_0_0_text = '';
      grid_1_0_text = '';
      grid_2_0_text = '';
      grid_0_1_text = '';
      grid_1_1_text = '';
      grid_2_1_text = '';
      grid_0_2_text = '';
      grid_1_2_text = '';
      grid_2_2_text = '';

      grid_0_0_enable = true;
      grid_1_0_enable = true;
      grid_2_0_enable = true;
      grid_0_1_enable = true;
      grid_1_1_enable = true;
      grid_2_1_enable = true;
      grid_0_2_enable = true;
      grid_1_2_enable = true;
      grid_2_2_enable = true;
      CurrTurn = 0;
      // print(gridListSym);
      if (!GameCode().areGridListsEqual(gridListSym, [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
      ])) {
        currentRound++;
      }
      gridListSym = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
      ];
      player1Light = true;
      player2Light = false;
      setState(() {});
    }

    void disableAllBut() {
      grid_0_0_enable = false;
      grid_1_0_enable = false;
      grid_2_0_enable = false;
      grid_0_1_enable = false;
      grid_1_1_enable = false;
      grid_2_1_enable = false;
      grid_0_2_enable = false;
      grid_1_2_enable = false;
      grid_2_2_enable = false;
    }

    bool checkWin() {
      CurrTurn++;
      if (GameCode().areGridFilled(gridListSym) &&
          !GameCode().isGameWonBool(gridListSym)) {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                  child: Container(
                    width: 200,
                    height: 220,
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
                        color: HexColor('#011627')),
                    child: Column(
                      children: [
                        Center(
                            child: Lottie.asset('assets/peopleVsPeople.json',
                                repeat: true,
                                width: 200,
                                height: 100,
                                fit: BoxFit.cover)),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text("Match Tie",
                              style: TextStyle(
                                  fontFamily: 'Lobster',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30,
                                  color: Colors.white)),
                        ),
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop((context));
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor('#fb2c56')),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ));
      }
      int whoWon = GameCode().isGameWon(gridListSym);
      if (whoWon == 1) {
        disableAllBut();
        player1TWin++;
        showDialog(
            context: context,
            builder: (context) => Dialog(
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
                        color: HexColor('#011627')),
                    child: Column(
                      children: [
                        Center(
                            child: Lottie.asset('assets/winAnimation.json',
                                repeat: true,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill)),
                        Text("${widget.player1Name} Won",
                            style: TextStyle(
                                fontFamily: 'Lobster',
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                color: Colors.white)),
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop((context));
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor('#fb2c56')),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ));
        setState(() {});
        return true;
      } else if (whoWon == 2) {
        disableAllBut();
        pcTWin++;
        showDialog(
            context: context,
            builder: (context) => Dialog(
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
                        color: HexColor('#011627')),
                    child: Column(
                      children: [
                        Center(
                            child: Lottie.asset('assets/winAnimation.json',
                                repeat: true,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill)),
                        Text("${widget.player2Name} Won",
                            style: TextStyle(
                                fontFamily: 'Lobster',
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                color: Colors.white)),
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop((context));
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor('#fb2c56')),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ));
        resetButText = widget.player2Name;
        setState(() {});
        return true;
      }
      setState(() {});
      return false;
    }

    void ComMovInAction(String gridNum) {
      if (gridNum == "00") {
        grid_0_0_col == OSymbolColor;
        grid_0_0_text = currentTerm();
        gridListSym[1][0] = 2;
        grid_0_0_enable = false;
      } else if (gridNum == "10") {
        grid_1_0_col == OSymbolColor;
        grid_1_0_text = currentTerm();
        gridListSym[1][0] = 2;
        grid_1_0_enable = false;
      } else if (gridNum == "20") {
        grid_2_0_col == OSymbolColor;
        grid_2_0_text = currentTerm();
        gridListSym[2][0] = 2;
        grid_2_0_enable = false;
      } else if (gridNum == "01") {
        grid_0_1_col == OSymbolColor;
        grid_0_1_text = currentTerm();
        gridListSym[0][1] = 2;
        grid_0_1_enable = false;
      } else if (gridNum == "11") {
        grid_1_1_col == OSymbolColor;
        grid_1_1_text = currentTerm();
        gridListSym[1][1] = 2;
        grid_1_1_enable = false;
      } else if (gridNum == "21") {
        grid_2_1_col == OSymbolColor;
        grid_2_1_text = currentTerm();
        gridListSym[2][1] = 2;
        grid_2_1_enable = false;
      } else if (gridNum == "02") {
        grid_0_2_col == OSymbolColor;
        grid_0_2_text = currentTerm();
        gridListSym[0][2] = 2;
        grid_0_2_enable = false;
      } else if (gridNum == "12") {
        grid_1_2_col == OSymbolColor;
        grid_1_2_text = currentTerm();
        gridListSym[1][2] = 2;
        grid_1_2_enable = false;
      } else if (gridNum == "22") {
        grid_2_2_col == OSymbolColor;
        grid_2_2_text = currentTerm();
        gridListSym[2][2] = 2;
        grid_2_2_enable = false;
      }
      bool isWin = checkWin();
    }

    Future<void> clickFun(String gridNum, bool comMov) async {
      if (currentTerm() == 'x') {
        player1Light = false;
        player2Light = true;
      } else {
        player1Light = true;
        player2Light = false;
      }

      // Computer Move
      if (comMov) {
        Timer(Duration(milliseconds: 250), () {
          if (currentTerm() == '0') {
            if (!gridNum.startsWith('-')) {
              ComMovInAction(gridNum);
            }
          }
        });
      } else {
        if (gridNum == "00" && currentTerm() == 'x') {
          grid_0_0_col == xSymbolColor;
          grid_0_0_text = currentTerm();
          gridListSym[0][0] = 1;
          grid_0_0_enable = false;
        } else if (gridNum == "10" && currentTerm() == 'x') {
          grid_1_0_col == xSymbolColor;
          grid_1_0_text = currentTerm();
          grid_1_0_enable = false;
          gridListSym[1][0] = 1;
        } else if (gridNum == "20" && currentTerm() == 'x') {
          grid_2_0_col == xSymbolColor;
          grid_2_0_text = currentTerm();
          gridListSym[2][0] = 1;
          grid_2_0_enable = false;
        } else if (gridNum == "01" && currentTerm() == 'x') {
          grid_0_1_col == xSymbolColor;
          grid_0_1_text = currentTerm();
          grid_0_1_enable = false;
          gridListSym[0][1] = 1;
        } else if (gridNum == "11" && currentTerm() == 'x') {
          grid_1_1_col == xSymbolColor;
          grid_1_1_text = currentTerm();
          gridListSym[1][1] = 1;
          grid_1_1_enable = false;
        } else if (gridNum == "21" && currentTerm() == 'x') {
          grid_2_1_col == xSymbolColor;
          grid_2_1_text = currentTerm();
          gridListSym[2][1] = 1;
          grid_2_1_enable = false;
        } else if (gridNum == "02" && currentTerm() == 'x') {
          grid_0_2_col == xSymbolColor;
          grid_0_2_text = currentTerm();
          gridListSym[0][2] = 1;
          grid_0_2_enable = false;
        } else if (gridNum == "12" && currentTerm() == 'x') {
          grid_1_2_col == xSymbolColor;
          grid_1_2_text = currentTerm();
          gridListSym[1][2] = 1;
          grid_1_2_enable = false;
        } else if (gridNum == "22" && currentTerm() == 'x') {
          grid_2_2_col == xSymbolColor;
          grid_2_2_text = currentTerm();
          gridListSym[2][2] = 1;
          grid_2_2_enable = false;
        }
        bool isWin = checkWin();
        if (!isWin) {
          await clickFun(GameCode().compMove(gridListSym), true);
        }
      }
    }

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
              colors: [
                HexColor(background),
                HexColor(appBarTopColor)
              ], // Specify your gradient colors
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
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),

            // Current Round Widget
            Center(
              child: Text('Round $currentRound',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Kalnia',
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      color: HexColor(fontColor))),
            ),
            const SizedBox(
              height: 50,
            ),

            Row(
              children: [
                const Expanded(child: SizedBox()),

                // Player 1 Container Widget
                Container(
                  height: 200,
                  width: 140,
                  decoration: BoxDecoration(
                    boxShadow: player1Light
                        ? [
                            BoxShadow(
                              color: HexColor(gameCardShadding),
                              blurRadius: 40,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.outer, // Correct property
                            )
                          ]
                        : [],
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    color: HexColor(containerBackground),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: [
                      // Player 1 Container (Lottie) Widget
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SizedBox(
                            height: 70,
                            width: 70,
                            child: player1Light
                                ? LottieBuilder.asset(
                                    '$lottiePlayer1',
                                    reverse: true,
                                    repeat: true,
                                  )
                                : LottieBuilder.asset(
                                    '$lottiePlayer1',
                                    reverse: true,
                                    repeat: false,
                                  )),
                      ),

                      // Player 1 Container (playerName) Widget
                      Text(
                        widget.player1Name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Kalnia',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: HexColor(fontColor),
                        ),
                      ),

                      // Player 1 Container (t Win Widget) Widget
                      Text(
                        'Win: ${player1TWin}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          color: HexColor(fontColor),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // Player 1 Container (playerSym) Widget
                      Text(
                        '${player1Sym}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Kalnia',
                          fontSize: 30,
                          color: HexColor(xSymbolColor),
                        ),
                      )
                    ],
                  ),
                ),

                const Expanded(child: SizedBox()),

                // Player 2 Container Widget
                Container(
                  height: 200,
                  width: 140,
                  decoration: BoxDecoration(
                    boxShadow: player2Light
                        ? [
                            BoxShadow(
                              color: HexColor(gameCardShadding),
                              blurRadius: 40,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.outer, // Correct property
                            )
                          ]
                        : [],
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    color: HexColor(containerBackground),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: [
                      // Player 2 Container (Lottie) Widget
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SizedBox(
                            height: 70,
                            width: 70,
                            child: player1Light
                                ? LottieBuilder.asset('$lottiePlayer2',
                                    reverse: true)
                                : LottieBuilder.asset('$lottiePlayer2',
                                    reverse: true)),
                      ),

                      // Player 2 Container (playerName) Widget
                      Text(
                        widget.player2Name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Kalnia',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: HexColor(fontColor),
                        ),
                      ),

                      // Player 2 Container (t Win Widget) Widget
                      Text(
                        'Win: ${pcTWin}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          color: HexColor(fontColor),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // Player 2 Container (playerSym) Widget
                      Text(
                        '${player2Sym}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Kalnia',
                          fontSize: 30,
                          color: HexColor(xSymbolColor),
                        ),
                      )
                    ],
                  ),
                ),

                const Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(
              height: 50,
            ),

            // Grid Of TicTacToe Widget
            Container(
              height: 290,
              width: 290,
              color: HexColor('$gridHashColor'),
              child: Row(
                children: [
                  Column(
                    children: [
                      // TicTacToe Grid [0][0] Widget
                      GestureDetector(
                        onTap: () async {
                          if (grid_0_0_enable) {
                            await clickFun("00", false);
                          }
                        },
                        child: Container(
                          height: 90,
                          width: 90,
                          color: HexColor(background),
                          child: Center(
                              child: Text(
                            '${grid_0_0_text}',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                // fontFamily: 'MountainFont',
                                fontSize: 70,
                                color: HexColor(
                                  '${grid_0_0_col}',
                                )),
                          )),
                        ),
                      ),

                      // TicTacToe Grid [1][0] Widget
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () async {
                            if (grid_1_0_enable) {
                              await clickFun("10", false);
                            }
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            color: HexColor(background),
                            child: Center(
                                child: Text(
                              '${grid_1_0_text}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  // fontFamily: 'MountainFont',
                                  fontSize: 70,
                                  color: HexColor(
                                    '$grid_1_0_col',
                                  )),
                            )),
                          ),
                        ),
                      ),

                      // TicTacToe Grid [2][0] Widget
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () async {
                            if (grid_2_0_enable) {
                              await clickFun("20", false);
                            }
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            color: HexColor(background),
                            child: Center(
                                child: Text(
                              '${grid_2_0_text}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  // fontFamily: 'MountainFont',
                                  fontSize: 70,
                                  color: HexColor(
                                    '${grid_2_0_col}',
                                  )),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // TicTacToe Grid [0][1] Widget
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () async {
                            if (grid_0_1_enable) {
                              await clickFun("01", false);
                            }
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            color: HexColor(background),
                            child: Center(
                                child: Text(
                              '${grid_0_1_text}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  // fontFamily: 'MountainFont',
                                  fontSize: 70,
                                  color: HexColor(
                                    '$grid_0_1_col',
                                  )),
                            )),
                          ),
                        ),
                      ),

                      // TicTacToe Grid [1][1] Widget
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: GestureDetector(
                          onTap: () async {
                            if (grid_1_1_enable) {
                              await clickFun("11", false);
                            }
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            color: HexColor(background),
                            child: Center(
                                child: Text(
                              '${grid_1_1_text}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  // fontFamily: 'MountainFont',
                                  fontSize: 70,
                                  color: HexColor(
                                    '$grid_1_1_col',
                                  )),
                            )),
                          ),
                        ),
                      ),

                      // TicTacToe Grid [2][1] Widget
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: GestureDetector(
                          onTap: () async {
                            if (grid_2_1_enable) {
                              await clickFun("21", false);
                            }
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            color: HexColor(background),
                            child: Center(
                                child: Text(
                              '${grid_2_1_text}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  // fontFamily: 'MountainFont',
                                  fontSize: 70,
                                  color: HexColor(
                                    '$grid_2_1_col',
                                  )),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // TicTacToe Grid [0][2] Widget
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () async {
                            if (grid_0_2_enable) {
                              await clickFun("02", false);
                            }
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            color: HexColor(background),
                            child: Center(
                                child: Text(
                              '${grid_0_2_text}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  // fontFamily: 'MountainFont',
                                  fontSize: 70,
                                  color: HexColor(
                                    '$grid_0_2_col',
                                  )),
                            )),
                          ),
                        ),
                      ),

                      // TicTacToe Grid [1][2] Widget
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: GestureDetector(
                          onTap: () async {
                            if (grid_1_2_enable) {
                              await clickFun("12", false);
                            }
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            color: HexColor(background),
                            child: Center(
                                child: Text(
                              '${grid_1_2_text}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  // fontFamily: 'MountainFont',
                                  fontSize: 70,
                                  color: HexColor(
                                    '$grid_1_2_col',
                                  )),
                            )),
                          ),
                        ),
                      ),

                      // TicTacToe Grid [2][2] Widget
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: GestureDetector(
                          onTap: () async {
                            if (grid_2_2_enable) {
                              await clickFun("22", false);
                            }
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            color: HexColor(background),
                            child: Center(
                                child: Text(
                              '${grid_2_2_text}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  // fontFamily: 'MountainFont',
                                  fontSize: 70,
                                  color: HexColor(
                                    '$grid_2_2_col',
                                  )),
                            )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            // Reset Button
            SizedBox(
              width: 290,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#8B0000'),
                      foregroundColor: HexColor('#9ba9b2')),
                  onPressed: () {
                    restartButton();
                  },
                  child: Text('$resetButText')),
            )
          ],
        )),
      ),
    );
  }
}
