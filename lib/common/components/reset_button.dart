import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:memory_game/provider/game_provider.dart';

class ResetButton extends StatelessWidget {
  final GameProvider gameProvider;

  const ResetButton({
    super.key,
    required this.gameProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: gameProvider.initializeGame,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
          vertical: 16.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        gameProvider.won ? 'Play Again' : 'Reset',
        style: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
