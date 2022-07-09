import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_xo/data/functions.dart';
import 'package:flutter_xo/screens/endgame.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  void winFunc(int id) {
    switch (id) {
      case -1:
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false, // set to false
            pageBuilder: (_, __, ___) => EndGamePage(
              state: "Draw",
              clr: Colors.grey.withOpacity(0.5),
            ),
          ),
        );
        break;
      case 0:
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false, // set to false
            pageBuilder: (_, __, ___) => EndGamePage(
              state: "Player X Won",
              clr: Colors.green.withOpacity(0.5),
            ),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false, // set to false
            pageBuilder: (_, __, ___) => EndGamePage(
              state: "Player O Won",
              clr: Colors.red.withOpacity(0.5),
            ),
          ),
        );
        break;
      default:
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false, // set to false
            pageBuilder: (_, __, ___) => EndGamePage(
              state: "Draw",
              clr: Colors.grey.withOpacity(0.5),
            ),
          ),
        );
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Functions.resetTable();
    Functions.winFunc = winFunc;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double size = min(width, height);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Functions.players[Functions.currentTurn].name),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: size,
            width: size,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  int y = index % 3;
                  int x = index ~/ 3;
                  return Card(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => {
                        Functions.doMove(x, y),
                        setState(() => {}),
                      },
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          '${Functions.gameTable[x][y]}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
