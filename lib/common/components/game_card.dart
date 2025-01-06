import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:memory_game/provider/game_provider.dart';

class GameCard extends StatelessWidget {
  final int index;
  final GameProvider gameProvider;

  const GameCard({
    super.key,
    required this.index,
    required this.gameProvider,
  });

  @override
  Widget build(BuildContext context) {
    if (gameProvider.cards[index] == null) {
      return Container(
        decoration: BoxDecoration(
          // color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }

    final isFlipped = gameProvider.flipped.contains(index) ||
        gameProvider.solved.contains(index);
    final isSolved = gameProvider.solved.contains(index);

    return GestureDetector(
      onTap: () => gameProvider.handleCardTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isSolved
              ? Colors.green.withOpacity(0.7)
              : isFlipped
                  ? Colors.blue
                  : const Color.fromARGB(255, 36, 63, 118),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isSolved
                  ? Colors.green
                  : isFlipped
                      ? Colors.blue
                      : Colors.blue),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Center(
          child: Text(
            isFlipped || gameProvider.showNumberFirstTime
                ? '${gameProvider.cards[index]!.number}'
                : '?',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: isFlipped ? Colors.white : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
