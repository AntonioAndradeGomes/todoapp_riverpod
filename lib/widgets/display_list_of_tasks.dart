import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_riverpod/config/l10n/l10n.dart';
import 'package:todoapp_riverpod/data/data.dart';
import 'package:todoapp_riverpod/providers/providers.dart';
import 'package:todoapp_riverpod/utils/utils.dart';
import 'widgets.dart';

class DisplayListOfTasks extends ConsumerWidget {
  final List<Task> tasks;
  final bool isCompletedTasks;
  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage = isCompletedTasks
        ? l10n.listTaskTodoCompletedEmpty
        : l10n.listTaskTodoEmpty;
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              clipBehavior: Clip.hardEdge,
              itemCount: tasks.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    //deletar task
                    AppAlerts.showDeleteAlertDialog(
                      context,
                      ref,
                      task,
                    );
                  },
                  onTap: () async {
                    //detalhes da task

                    await showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return TaskDetails(
                          task: task,
                        );
                      },
                    );
                  },
                  child: TaskTile(
                    task: task,
                    onCompleted: (value) async {
                      await ref
                          .read(taskProvider.notifier)
                          .updateTask(task)
                          .then(
                            (value) => AppAlerts.displaySnackBar(
                              context,
                              task.isCompleted
                                  ? l10n.incompleted
                                  : l10n.completed,
                            ),
                          );
                    },
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
