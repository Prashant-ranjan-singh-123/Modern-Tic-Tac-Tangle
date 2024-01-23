import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_final/UserNameAsking.dart';
import 'UsrVsCom.dart';

class AskingPage extends StatefulWidget {
  const AskingPage({super.key});

  @override
  State<AskingPage> createState() => _AskingPageState();
}

class _AskingPageState extends State<AskingPage> {
  String appBarTitle = 'Tic Tac Toe';
  String quoteOfTheDay = "";
  String background = "#0e1531";
  String containerBackground = "#2b3566";
  String appBarTopColor = "#684dfc";
  String fontColor = "#ffffff";
  String gameCardShadding = "#49554b";
  String gameCardInnerColor = "#011627";
  String welcomeMessage = 'Hello Gamer,';
  String subtitleBellowHello = 'Quote of the day';
  String usrVsUsr = "User vs User";
  String usrVsCom = "User vs Computer";
  String choseOne = "Choise any one";

  void usrVsUsrFun() {
    Navigator.push(
        context, MaterialPageRoute(builder: (Context) => const UsrVsUsrNameScreen()));
  }

  void usrVsComFun() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UsrVsComStartGame(player1Name: 'Player', player2Name: 'Computer')));
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>UsrVsComStartGame()));
  }

  void aboutMeFunction() {}

  @override
  void initState() {
    super.initState();
    quoteOfTheDay = Quotes().randomQuotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appBarTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Kalnia',
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
      body: SingleChildScrollView(
        child: Container(
            // width: double.infinity,
            // height: double.infinity,
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
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: HexColor(appBarTopColor),
                                    blurStyle: BlurStyle.outer,
                                    spreadRadius: 1,
                                    blurRadius: 40)
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              color: HexColor(containerBackground)),
                          child: Lottie.asset('assets/Brain.json')),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(welcomeMessage,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'MountainFont',
                          fontWeight: FontWeight.w800,
                          fontSize: 35,
                          color: HexColor('#c16a45'))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(subtitleBellowHello,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: HexColor('#ffffff'))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(quoteOfTheDay,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: 'DancingFont',
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: HexColor('#b2fa74'))),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(choseOne,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decorationColor: Colors.lightGreenAccent,
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                          color: HexColor('#9c91c1'))),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(usrVsUsr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Kalnia',
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: HexColor(fontColor))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: InkResponse(
                          onTap: () {
                            usrVsUsrFun();
                          },
                        child: Container(
                            width: 200,
                            height: 150,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3),
                                boxShadow: [
                                  BoxShadow(
                                    color: HexColor(gameCardShadding),
                                    blurStyle: BlurStyle.outer,
                                    spreadRadius: 1,
                                    blurRadius: 40,
                                  )
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20.0)),
                                color: HexColor(gameCardInnerColor)),
                            child: Lottie.asset('assets/peopleVsPeople.json')),
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(usrVsCom,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Kalnia',
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: HexColor(fontColor))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: InkResponse(
                        onTap: () {
                          usrVsComFun();
                        },
                        child: Container(
                            width: 200,
                            height: 150,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3),
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
                            child: Lottie.asset('assets/peopleVsRobot.json')),
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onSecondaryLongPress: () {
                    aboutMeFunction();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 25,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: HexColor('#011627'),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0))),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Made By Prashant Ranjan Singh",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lobster',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class Quotes {
  String randomQuotes() {
    List<String> quotes = [
      "Gaming is the symphony where strategy and skill play in harmony.",
      "The console is a canvas; your skills paint the masterpiece of triumph.",
      "In the realm of pixels, each challenge is a call to adventure.",
      "Every game is a story waiting to be written by the player.",
      "The true gamer knows that every setback is a setup for a comeback.",
      "In the labyrinth of life, gaming is the map to self-discovery.",
      "A gamer's legacy is written in high scores and moments of glory.",
      "Gaming is the heartbeat of joy in the language of pixels.",
      "The joystick is a wand, and every move is a magical spell.",
      "In the pixelated cosmos, each quest is a star in the sky.",
      "A game is a journey, and every defeat is a detour, not a dead end.",
      "The console is the portal; your courage is the key.",
      "Life is a game where every choice is a plot twist.",
      "In the RPG of life, your character evolves with every decision.",
      "Gaming is the arena where heroes rise from the pixels.",
      "In the world of games, the story is co-authored by the player.",
      "Every game is a puzzle, and skill is the missing piece.",
      "A gamer's heart beats in sync with the rhythm of the joystick.",
      "The console is a time machine; the game, a journey through eras.",
      "In the universe of play, gamers are the architects of their destiny.",
      "Gaming is a marathon where every level is a milestone.",
      "The true gamer thrives in the challenge, not just the victory.",
      "In the game of life, every respawn is a chance for redemption.",
      "Gaming is the art of turning pixels into a masterpiece of skill.",
      "Every pixel holds a story, and every gamer is an author.",
      "The controller is a magic wand; your skills cast the enchantment.",
      "Life is a co-op; make sure to team up for success.",
      "In the pixelated saga, every defeat is a prelude to triumph.",
      "Gaming is the passport to realms where dreams become reality.",
      "The joystick guides, but the gamer's spirit conquers.",
      "In the game of life, courage is the ultimate power-up.",
      "Gaming is the arena where passion and perseverance collide.",
      "Every game is a canvas, and your moves paint the masterpiece.",
      "The true gamer doesn't chase victories; they savor the journey.",
      "In the console of existence, every moment is a respawn.",
      "Gaming is a pilgrimage to the sacred land of victory.",
      "The controller is a compass, pointing toward uncharted adventures.",
      "Life is an open-world game; explore, conquer, and level up.",
      "In the realm of pixels, every challenge is a hidden treasure.",
      "The true gamer is an alchemist turning challenges into achievements.",
      "Gaming is a dance; your fingers move to the rhythm of victory.",
      "In the RPG of life, every choice is a character-defining moment.",
      "The console is a gateway; your skills unlock new dimensions.",
      "Gaming is the art of resilience, painted on the canvas of challenges.",
      "Every game is a chapter, and you're the author of your story.",
      "In the pixelated tapestry of life, gamers weave their own destiny.",
      "Gaming is a quest; your skills are the weapons of triumph.",
      "The joystick is a compass guiding the gamer through uncharted territories.",
      "Life is a sandbox; gamers shape their destiny with every move.",
      "In the universe of play, every pixel tells a tale of victory.",
      "Gaming is the laboratory where dreams are mixed with skill.",
      "The console is a time capsule; each game a journey through epochs.",
      "Every game is a journey, and every journey is an adventure.",
      "In the symphony of play, the controller is the conductor's baton.",
      "Gaming is the treasure hunt where victory is the ultimate prize.",
      "Life is a multiplayer game; make sure your team is legendary.",
      "The console is a spaceship; your skills navigate through galaxies.",
      "Every game is a canvas; your choices paint the masterpiece of life.",
      "In the arcade of existence, every game over is a restart.",
      "Gaming is a labyrinth; skill is the thread guiding you through.",
      "The joystick is a compass pointing toward realms of infinite possibilities.",
      "Life is a strategy game; plan your moves wisely for victory.",
      "In the pixelated symphony, each move is a note in the melody of success.",
      "Gaming is the tapestry where perseverance threads the needle of victory.",
      "The controller is a magic wand; every button press is a spell cast.",
      "Every game is a poem; your skills create the verses of triumph.",
      "In the realm of pixels, every challenge is a bridge to mastery.",
      "Gaming is the pilgrimage where every level is a sacred site.",
      "Life is a game board; strategize your moves to conquer it.",
      "The console is a time machine; every game is a journey through eras.",
      "In the RPG of life, your choices determine your character's evolution.",
      "Gaming is the kaleidoscope of challenges refracted into moments of victory.",
      "Every game is a canvas; your skills paint the portrait of triumph.",
      "The joystick is a compass; your skills guide you through uncharted territories.",
      "In the world of pixels, every challenge is a stepping stone to greatness.",
      "Gaming is a marathon; every level is a milestone on the road to victory.",
      "Life is a game of chess; each move determines your destiny.",
      "The console is a portal; your skills unlock the gates to victory.",
      "In the pixelated saga, every defeat is a prelude to a greater triumph.",
      "Gaming is the tapestry where challenges are woven into the fabric of victory.",
      "The joystick is a magic wand; every move is a spell in the dance of triumph.",
      "Every game is a journey; your skills are the compass guiding the way.",
      "In the symphony of play, the controller conducts the melody of victory.",
      "Gaming is the alchemy where challenges are transformed into achievements.",
      "Life is a strategy game; each decision shapes your path to triumph.",
      "The console is a time capsule; each game is a chapter in history.",
      "In the realm of pixels, every challenge is a puzzle to be solved.",
      "Gaming is the pilgrimage where every level is a sacred step.",
      "The joystick is a compass guiding the gamer through uncharted territories.",
      "Every game is a canvas; your moves paint the masterpiece of victory.",
      "In the arcade of existence, every game over is a restart button.",
      "Gaming is a labyrinth; skill is the thread guiding you through.",
      "The joystick is a compass pointing toward realms of infinite possibilities.",
      "Life is a strategy game; plan your moves wisely for victory.",
      "In the pixelated symphony, each move is a note in the melody of success.",
      "Gaming is the tapestry where perseverance threads the needle of victory.",
      "The controller is a magic wand; every button press is a spell cast.",
      "Every game is a poem; your skills create the verses of triumph.",
      "In the realm of pixels, every challenge is a bridge to mastery.",
      "Gaming is the pilgrimage where every level is a sacred site.",
      "Life is a game board; strategize your moves to conquer it.",
      "The console is a time machine; every game is a journey through eras.",
      "In the RPG of life, your choices determine your character's evolution.",
      "Gaming is the kaleidoscope of challenges refracted into moments of victory.",
      "Every game is a canvas; your skills paint the portrait of triumph.",
      "The joystick is a compass; your skills guide you through uncharted territories.",
      "In the world of pixels, every challenge is a stepping stone to greatness.",
      "Gaming is a marathon; every level is a milestone on the road to victory.",
      "Life is a game of chess; each move determines your destiny.",
      "The console is a portal; your skills unlock the gates to victory.",
      "In the pixelated saga, every defeat is a prelude to a greater triumph.",
      "Gaming is the tapestry where challenges are woven into the fabric of victory.",
      "The joystick is a magic wand; every move is a spell in the dance of triumph.",
      "Every game is a journey; your skills are the compass guiding the way.",
      "In the symphony of play, the controller conducts the melody of victory.",
      "Gaming is the alchemy where challenges are transformed into achievements.",
      "Life is a strategy game; each decision shapes your path to triumph.",
      "The console is a time capsule; each game is a chapter in history.",
      "In the realm of pixels, every challenge is a puzzle to be solved.",
      "Gaming is the pilgrimage where every level is a sacred step.",
      "The joystick is a compass guiding the gamer through uncharted territories.",
      "Every game is a canvas; your moves paint the masterpiece of victory.",
      "In the arcade of existence, every game over is a restart button.",
      "Gaming is a labyrinth; skill is the thread guiding you through.",
      "The joystick is a compass pointing toward realms of infinite possibilities.",
      "Life is a strategy game; plan your moves wisely for victory.",
      "In the pixelated symphony, each move is a note in the melody of success.",
      "Gaming is the tapestry where perseverance threads the needle of victory.",
      "The controller is a magic wand; every button press is a spell cast.",
      "Every game is a poem; your skills create the verses of triumph.",
      "In the realm of pixels, every challenge is a bridge to mastery.",
      "Gaming is the pilgrimage where every level is a sacred site.",
      "The joystick is a compass; your skills guide you through uncharted territories.",
      "Every game is a canvas; your skills paint the portrait of triumph.",
      "In the arcade of existence, every game over is a restart button.",
      "Gaming is a labyrinth; skill is the thread guiding you through.",
      "The joystick is a compass pointing toward realms of infinite possibilities.",
      "Life is a strategy game; plan your moves wisely for victory.",
      "In the pixelated symphony, each move is a note in the melody of success.",
      "Gaming is the tapestry where perseverance threads the needle of victory.",
      "The controller is a magic wand; every button press is a spell cast.",
      "Every game is a poem; your skills create the verses of triumph.",
      "In the realm of pixels, every challenge is a bridge to mastery.",
      "Gaming is the pilgrimage where every level is a sacred site.",
      "The joystick is a compass; your skills guide you through uncharted territories.",
      "Every game is a canvas; your skills paint the portrait of triumph.",
      "In the arcade of existence, every game over is a restart button.",
      "Gaming is a labyrinth; skill is the thread guiding you through.",
      "The joystick is a compass pointing toward realms of infinite possibilities.",
      "Life is a strategy game; plan your moves wisely for victory.",
      "In the pixelated symphony, each move is a note in the melody of success.",
      "Gaming is the tapestry where perseverance threads the needle of victory.",
      "The controller is a magic wand; every button press is a spell cast.",
      "Every game is a poem; your skills create the verses of triumph.",
      "In the realm of pixels, every challenge is a bridge to mastery.",
      "Gaming is the pilgrimage where every level is a sacred site.",
      "The joystick is a compass; your skills guide you through uncharted territories.",
      "Every game is a canvas; your skills paint the portrait of triumph.",
      "In the arcade of existence, every game over is a restart button.",
      "Gaming is a labyrinth; skill is the thread guiding you through.",
      "The joystick is a compass pointing toward realms of infinite possibilities.",
      "Life is a strategy game; plan your moves wisely for victory.",
      "In the pixelated symphony, each move is a note in the melody of success.",
      "Gaming is the tapestry where perseverance threads the needle of victory.",
      "The controller is a magic wand; every button press is a spell cast.",
      "Every game is a poem; your skills create the verses of triumph.",
      "In the realm of pixels, every challenge is a bridge to mastery.",
      "Gaming is the pilgrimage where every level is a sacred site.",
      "The joystick is a compass; your skills guide you through uncharted territories.",
      "Every game is a canvas; your skills paint the portrait of triumph.",
      "In the arcade of existence, every game over is a restart button.",
      "Gaming is a labyrinth; skill is the thread guiding you through.",
      "The joystick is a compass pointing toward realms of infinite possibilities.",
      "Life is a strategy game; plan your moves wisely for victory.",
      "In the pixelated symphony, each move is a note in the melody of success.",
      "Gaming is the tapestry where perseverance threads the needle of victory.",
      "The controller is a magic wand; every button press is a spell cast.",
      "Every game is a poem; your skills create the verses of triumph."
    ];
    Random random = Random();
    int randomIndex = random.nextInt(quotes.length);
    return quotes[randomIndex];
  }
}