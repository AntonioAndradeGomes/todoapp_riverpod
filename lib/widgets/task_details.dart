import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todoapp_riverpod/config/l10n/l10n.dart';
import 'package:todoapp_riverpod/utils/extensions.dart';
import 'package:todoapp_riverpod/widgets/widgets.dart';
import '../data/models/models.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final styles = context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(30).h,
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          Gap(16.h),
          Text(
            task.title,
            style: styles.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          Text(
            task.time,
            style: styles.titleMedium,
          ),
          Gap(16.h),
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.toBeCompleted,
                ),
                Text(
                  task.date,
                ),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                ),
              ],
            ),
          ),
          Gap(16.h),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          Gap(16.h),
          Text(
            task.note.isEmpty ? l10n.additionalNote : task.note,
          ),
          Gap(16.h),
          Visibility(
            visible: task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.completed,
                ),
                const Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
