import 'package:flutter/material.dart';
import 'package:todoapp_riverpod/utils/utils.dart';

class DisplayWhiteText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  const DisplayWhiteText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineSmall?.copyWith(
        color: context.colorScheme.brightness == Brightness.light
            ? context.colorScheme.surface
            : context.colorScheme.onSurface,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}
