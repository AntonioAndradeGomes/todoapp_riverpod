import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhiteText(
          text: l10n.addNewTask,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20).h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                hintText: l10n.title,
                title: l10n.titleTask,
                controller: _titleController,
              ),
              Gap(16.h),
              const SelectCategory(),
              Gap(16.h),
              const SelectionDateTime(),
              Gap(16.h),
              CommonTextField(
                hintText: l10n.note,
                title: l10n.noteTask,
                maxLines: 6,
                controller: _noteController,
              ),
              Gap(40.h),
              ElevatedButton(
                onPressed: _create,
                child: Padding(
                  padding: const EdgeInsets.all(8).h,
                  child: DisplayWhiteText(
                    text: l10n.save,
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
            context.l10n.created,
          );
          context.go(
            RouteLocation.home,
          );
        },
      );
    } else {
      AppAlerts.displaySnackBar(
        context,
        context.l10n.alertTaskNoCreated,
      );
    }
  }
}
