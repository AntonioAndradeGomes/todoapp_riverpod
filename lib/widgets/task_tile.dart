import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp_riverpod/data/data.dart';
import 'package:todoapp_riverpod/utils/extensions.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function(bool?)? onCompleted;

  const TaskTile({
    super.key,
    required this.task,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final backgroudOpacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: task.category.color.withOpacity(backgroudOpacity),
              border: Border.all(
                width: 2,
                color: task.category.color.withOpacity(iconOpacity),
              ),
            ),
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color.withOpacity(iconOpacity),
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: context.textTheme.titleMedium?.copyWith(
                    decoration: textDecoration,
                    fontSize: 20,
                    fontWeight: fontWeight,
                  ),
                ),
                Text(
                  task.time,
                  style: context.textTheme.titleMedium?.copyWith(
                    decoration: textDecoration,
                    fontWeight: fontWeight,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: task.isCompleted,
            onChanged: onCompleted,
          ),
        ],
      ),
    );
  }
}
