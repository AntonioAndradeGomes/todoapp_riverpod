import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp_riverpod/widgets/widgets.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTaskScreen();

  const CreateTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(
          text: 'Add New Task',
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CommonTextField(
              hintText: 'Task Title',
              title: 'Task Title',
            ),
          ],
        ),
      ),
    );
  }
}
