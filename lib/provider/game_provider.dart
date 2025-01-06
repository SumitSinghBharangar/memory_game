import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_game/common/components/card_item.dart';

class GameProvider extends ChangeNotifier {
  int _gridSize = 4;
  List<CardItem?> _cards = [];
  List<int> _flipped = [];
  List<int> _solved = [];
  bool _disabled = true;
  bool _won = false;
  bool _showNumberFirstTime = true;

  // Getters
  int get gridSize => _gridSize;
  List<CardItem?> get cards => _cards;
  List<int> get flipped => _flipped;
  List<int> get solved => _solved;
  bool get disabled => _disabled;
  bool get won => _won;
  bool get showNumberFirstTime => _showNumberFirstTime;

  GameProvider() {
    initializeGame();
  }

  void handleGridSize(int size) {
    if (size >= 2 && size <= 10) {
      _gridSize = size;
      initializeGame();
    }
  }

  void initializeGame() {
    final totalCells = _gridSize * _gridSize;
    final usableCells = (totalCells % 2 == 0) ? totalCells : totalCells - 1;
    final pairCount = usableCells ~/ 2;

    // Create list of pairs
    final List<int> numbers = [];
    for (int i = 1; i <= pairCount; i++) {
      numbers.add(i);
      numbers.add(i);
    }
    numbers.shuffle();

    // Create cards list with possible null for odd grids
    _cards = List.generate(totalCells, (index) {
      if (index < usableCells) {
        return CardItem(id: index, number: numbers[index]);
      } else {
        return null; // Empty cell for odd grids
      }
    });

    _flipped = [];
    _solved = [];
    _won = false;
    _disabled = true;
    _showNumberFirstTime = true;
    notifyListeners();

    Timer(const Duration(seconds: 2), () {
      _showNumberFirstTime = false;
      _disabled = false;
      notifyListeners();
    });
  }

  void checkMatch(int secondId) {
    final firstId = _flipped[0];
    if (_cards[firstId]?.number == _cards[secondId]?.number) {
      _solved.addAll([firstId, secondId]);
      _flipped = [];
      _disabled = false;

      // Check if won - only check active cards (non-null)
      if (_solved.length == _cards.where((card) => card != null).length) {
        _won = true;
      }
    } else {
      Timer(const Duration(seconds: 1), () {
        _flipped = [];
        _disabled = false;
        notifyListeners();
      });
    }
    notifyListeners();
  }

  void handleCardTap(int id) {
    // Ignore taps on null cards (empty cells)
    if (_disabled || _won || _solved.contains(id) || _cards[id] == null) return;

    if (_flipped.isEmpty) {
      _flipped = [id];
      notifyListeners();
    } else if (_flipped.length == 1 && id != _flipped[0]) {
      _flipped.add(id);
      _disabled = true;
      notifyListeners();
      checkMatch(id);
    }
  }
}
