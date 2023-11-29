import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todoapp_riverpod/config/l10n/l10n.dart';
import 'package:todoapp_riverpod/config/routes/routes.dart';
import 'package:todoapp_riverpod/providers/providers.dart';
import 'package:todoapp_riverpod/utils/utils.dart';
import 'package:todoapp_riverpod/widgets/widgets.dart';

import '../data/models/models.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final top = context.top;
    final taskState = ref.watch(taskProvider);
    final date = ref.watch(dateProvider);
    final completedTasks = _compltedTask(
      taskState.tasks,
      ref,
    );
    final incompletedTasks = _incompltedTask(
      taskState.tasks,
      ref,
    );
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(top),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => context.push(
                            RouteLocation.settings,
                          ),
                          color: colors.primaryContainer,
                          tooltip: l10n.settings,
                          icon: Icon(
                            size: 30,
                            Icons.settings,
                            color: colors.primaryContainer,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => Helpers.selectDate(context, ref),
                      child: DisplayWhiteText(
                        text: DateFormat.yMMMd().format(date),
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    DisplayWhiteText(
                      text: l10n.titleHomePage,
                      fontSize: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTasks(
                      tasks: incompletedTasks,
                    ),
                    const Gap(20),
                    Text(
                      l10n.completed,
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    DisplayListOfTasks(
                      tasks: completedTasks,
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(
                        RouteLocation.createTask,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DisplayWhiteText(
                          text: l10n.addNewTask,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> _incompltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (!task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }

  List<Task> _compltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }
}
