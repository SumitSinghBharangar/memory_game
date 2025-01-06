import 'package:flutter/material.dart';
import 'package:memory_game/common/components/game_card.dart';
import 'package:memory_game/provider/game_provider.dart';

class GameGrid extends StatelessWidget {
  final GameProvider gameProvider;

  const GameGrid({
    super.key,
    required this.gameProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.9,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gameProvider.gridSize,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: gameProvider.cards.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => GameCard(
            index: index,
            gameProvider: gameProvider,
          ),
        ),
      ),
    );
  }
}
