import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LooseMessage extends StatelessWidget {
  const LooseMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'You Loose! 🥲',
      style: TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }
}
