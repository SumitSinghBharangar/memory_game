import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WinMessage extends StatelessWidget {
  const WinMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'You Won!',
      style: TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }
}
