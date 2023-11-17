import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CommonTextField(
                hintText: 'Title',
                title: 'Task title',
              ),
              const Gap(16),
              const SelectCategory(),
              const Gap(16),
              const SelectionDateTime(),
              const Gap(16),
              const CommonTextField(
                hintText: 'Note',
                title: 'Task note',
                maxLines: 6,
              ),
              const Gap(50),
              ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DisplayWhiteText(
                    text: 'Save',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
