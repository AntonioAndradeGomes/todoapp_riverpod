import 'package:flutter/material.dart';
import 'package:todoapp_riverpod/utils/utils.dart';

class CommonContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  const CommonContainer({
    super.key,
    this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: context.deviceSize.width,
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
