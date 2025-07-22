import 'dart:math';
import 'package:flutter/material.dart';

class Playvscomputerviewmodel extends ChangeNotifier {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String winner = '';
  bool isGameOver = false;
  int counter1 = 0;
  int counter2 = 0;

  void playMove(int index) {
    if (board[index] == '' && !isGameOver) {
      board[index] = currentPlayer;
      checkWinner();

      if (!isGameOver && currentPlayer == 'X') {
        currentPlayer = 'O';
        computerPlay();
      }
    }
    notifyListeners();
  }

  void computerPlay() {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    // 1. Try to win
    for (var pattern in winPatterns) {
      String a = board[pattern[0]];
      String b = board[pattern[1]];
      String c = board[pattern[2]];
      if (a == b && a == 'O' && board[pattern[2]] == '') {
        board[pattern[2]] = 'O';
        currentPlayer = 'X';
        checkWinner();
        notifyListeners();
        return;
      }
      if (a == c && a == 'O' && board[pattern[1]] == '') {
        board[pattern[1]] = 'O';
        currentPlayer = 'X';
        checkWinner();
        notifyListeners();
        return;
      }
      if (b == c && b == 'O' && board[pattern[0]] == '') {
        board[pattern[0]] = 'O';
        currentPlayer = 'X';
        checkWinner();
        notifyListeners();
        return;
      }
    }

    // 2. Try to block X
    for (var pattern in winPatterns) {
      String a = board[pattern[0]];
      String b = board[pattern[1]];
      String c = board[pattern[2]];
      if (a == b && a == 'X' && board[pattern[2]] == '') {
        board[pattern[2]] = 'O';
        currentPlayer = 'X';
        checkWinner();
        notifyListeners();
        return;
      }
      if (a == c && a == 'X' && board[pattern[1]] == '') {
        board[pattern[1]] = 'O';
        currentPlayer = 'X';
        checkWinner();
        notifyListeners();
        return;
      }
      if (b == c && b == 'X' && board[pattern[0]] == '') {
        board[pattern[0]] = 'O';
        currentPlayer = 'X';
        checkWinner();
        notifyListeners();
        return;
      }
    }

    // 3. Play random
    List<int> emptyIndices = [];
    for (int i = 0; i < board.length; i++) {
      if (board[i] == '') emptyIndices.add(i);
    }
    emptyIndices.shuffle();
    if (emptyIndices.isNotEmpty) {
      board[emptyIndices.first] = 'O';
    }

    currentPlayer = 'X';
    checkWinner();
    notifyListeners();
  }

  void checkWinner() {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      String a = board[pattern[0]];
      String b = board[pattern[1]];
      String c = board[pattern[2]];

      if (a != '' && a == b && b == c) {
        winner = a;
        isGameOver = true;
        incrementCounter();
        return;
      }
    }

    if (!board.contains('')) {
      winner = 'Draw';
      isGameOver = true;
    }
  }

  void resetGame() {
    board = List.filled(9, '');
    currentPlayer = 'X';
    winner = '';
    isGameOver = false;
    notifyListeners();
    counter1 = 0;
    counter2 = 0;
  }

  void NextGame() {
    board = List.filled(9, '');
    currentPlayer = 'X';
    winner = '';
    isGameOver = false;
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
