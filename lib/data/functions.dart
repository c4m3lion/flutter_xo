import 'dart:math';

class Functions {
  static int currentTurn = 0;
  static int winStreak = 3;
  static List<Player> players = List.empty(growable: true);
  static List<List<String>> gameTable =
      List.generate(3, (i) => [' ', ' ', ' '], growable: false);

  static late Function winFunc;
  static int moveCount = 0;

  static void resetTable() {
    gameTable = List.generate(3, (i) => [' ', ' ', ' '], growable: false);
    players = [
      Player("Player X", 0, Signs.X),
      Player("Player O", 0, Signs.O),
    ];
    currentTurn = 0;
    moveCount = 0;
  }

  static void doMove(int x, int y) {
    if (gameTable[x][y] != ' ') return;

    moveCount++;
    gameTable[x][y] = Signs.values[currentTurn].name.toString();
    checkWin(x, y);
    currentTurn++;
    if (currentTurn >= players.length) {
      currentTurn = 0;
    }
  }

  static bool checkWin(int x, int y) {
    String tempCurrentSign = gameTable[x][y];
    int n = gameTable.length;
    //check col
    for (int i = 0; i <= n; i++) {
      if (gameTable[x][i] != tempCurrentSign) break;
      if (i == n - 1) {
        winFunc(currentTurn);
        return true;
      }
    }

    //check row
    for (int i = 0; i < n; i++) {
      if (gameTable[i][y] != tempCurrentSign) break;
      if (i == n - 1) {
        winFunc(currentTurn);
        return true;
      }
    }

    for (int i = 0; i < n; i++) {
      if (gameTable[i][i] != tempCurrentSign) break;
      if (i == n - 1) {
        winFunc(currentTurn);
        return true;
      }
    }

    //check anti diag (thanks rampion)
    for (int i = 0; i < n; i++) {
      if (gameTable[i][(n - 1) - i] != tempCurrentSign) break;
      if (i == n - 1) {
        winFunc(currentTurn);
        return true;
      }
    }

    //check draw
    if (moveCount >= (pow(n, 2))) {
      print(moveCount);
      winFunc(-1);
      return true;
    }
    return false;
  }
}

class Player {
  Player(this.name, this.score, this.playerSign);
  String name = "player_0";
  int score = 0;
  Signs playerSign = Signs.X;
}

enum Signs {
  X,
  O,
}
