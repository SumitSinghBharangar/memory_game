import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:memory_game/provider/game_provider.dart';

class GridSizeControl extends StatelessWidget {
  final GameProvider gameProvider;

  const GridSizeControl({
    super.key,
    required this.gameProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Grid Size: ',
          style: TextStyle(
            fontSize: 16.h,
            color: Colors.white,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
              ),
            ],
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () =>
                    gameProvider.handleGridSize(gameProvider.gridSize - 1),
              ),
              Container(
                width: 40,
                alignment: Alignment.center,
                child: Text(
                  '${gameProvider.gridSize}',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () =>
                    gameProvider.handleGridSize(gameProvider.gridSize + 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
