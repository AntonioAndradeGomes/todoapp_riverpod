import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todoapp_riverpod/config/config.dart';
import 'package:todoapp_riverpod/data/models/models.dart';
import 'package:todoapp_riverpod/providers/providers.dart';
import 'package:todoapp_riverpod/utils/utils.dart';
import 'package:todoapp_riverpod/widgets/widgets.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTaskScreen();

  const CreateTaskScreen({
    super.key,
  });

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

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
              CommonTextField(
                hintText: 'Title',
                title: 'Task title',
                controller: _titleController,
              ),
              const Gap(16),
              const SelectCategory(),
              const Gap(16),
              const SelectionDateTime(),
              const Gap(16),
              CommonTextField(
                hintText: 'Note',
                title: 'Task note',
                maxLines: 6,
                controller: _noteController,
              ),
              const Gap(50),
              ElevatedButton(
                onPressed: _create,
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

  void _create() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        note: note,
        time: Helpers.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        isCompleted: false,
        category: category,
      );

      await ref
          .read(
            taskProvider.notifier,
          )
          .createTask(task)
          .then(
        (value) {
          AppAlerts.displaySnackBar(
            context,
            'Task created Successfully',
          );
          context.go(
            RouteLocation.home,
          );
        },
      );
    } else {
      AppAlerts.displaySnackBar(
        context,
        'Task title cannot be empty',
      );
    }
  }
}
