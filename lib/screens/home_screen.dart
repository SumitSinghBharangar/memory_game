import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game/common/components/game_grid.dart';
import 'package:memory_game/common/components/grid_size_control.dart';
import 'package:memory_game/common/components/loose_message.dart';
import 'package:memory_game/common/components/reset_button.dart';
import 'package:memory_game/common/components/win_message.dart';
import 'package:memory_game/provider/game_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Show numbers temporarily

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1736),
      body: SafeArea(
        child: Consumer<GameProvider>(
          builder: (context, gameProvider, _) {
            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 16.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Memory Game',
                      style: TextStyle(
                        fontSize: 32.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Grid Size Controls
                    GridSizeControl(
                      gameProvider: gameProvider,
                    ),
                    SizedBox(height: 24.h),

                    // Game Grid
                    GameGrid(gameProvider: gameProvider),
                    SizedBox(height: 24.h),

                    // Win Message
                    if (gameProvider.won) const WinMessage(),
                    if (gameProvider.loose) const LooseMessage(),

                    // Reset Button
                    SizedBox(height: 16.h),
                    ResetButton(gameProvider: gameProvider),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
