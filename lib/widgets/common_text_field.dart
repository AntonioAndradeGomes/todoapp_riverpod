import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp_riverpod/utils/extensions.dart';

class CommonTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  const CommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        const Gap(10),
        TextField(
          controller: controller,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: hintText,
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
