import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleContainer extends StatelessWidget {
  final Color color;
  final Widget? child;
  const CircleContainer({
    super.key,
    required this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10).h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          width: 2,
          color: color,
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
