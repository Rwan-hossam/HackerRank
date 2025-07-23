import 'package:flutter/material.dart';

class PlayerVsPlayerViewModel extends ChangeNotifier {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String winner = '';
  int counter1 = 0;
  int counter2 = 0;

  void playMove(int index) {
    if (board[index] == '' && winner == '') {
      board[index] = currentPlayer;
      checkWinner();
      if (winner == '') {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
      notifyListeners();
    }
  }

  void checkWinner() {
    List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combo in winningCombinations) {
      final a = combo[0], b = combo[1], c = combo[2];
      if (board[a] != '' && board[a] == board[b] && board[b] == board[c]) {
        winner = board[a];
        incrementCounter();
        return;
      }
    }

    // Check for draw
    if (!board.contains('')) {
      winner = 'Draw';
    }
  }

  void resetGame() {
    board = List.filled(9, '');
    currentPlayer = 'X';
    winner = '';
    counter1 = 0;
    counter2 = 0;
    notifyListeners();
  }

  void NextGame() {
    board = List.filled(9, '');
    currentPlayer = 'X';
    winner = '';
    notifyListeners();
  }

  void incrementCounter() {
    if (winner == 'X') {
      counter1++;
    } else if (winner == 'O') {
      counter2++;
    }
  }
}
