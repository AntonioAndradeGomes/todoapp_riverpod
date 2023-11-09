import 'package:flutter/material.dart';
import 'package:todoapp_riverpod/data/data.dart';
import 'package:todoapp_riverpod/utils/extensions.dart';
import 'package:todoapp_riverpod/widgets/task_tile.dart';

import 'common_container.dart';

class DisplayListOfTasks extends StatelessWidget {
  final List<Task> tasks;
  final bool isCompletedTasks;
  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage = isCompletedTasks
        ? 'There is no completed task yet'
        : 'There is no task todo!';
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
              itemCount: tasks.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                final task = tasks[index];
                return TaskTile(
                  task: task,
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
