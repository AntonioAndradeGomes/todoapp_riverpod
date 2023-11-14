import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp_riverpod/config/routes/routes.dart';
import 'package:todoapp_riverpod/data/data.dart';
import 'package:todoapp_riverpod/utils/utils.dart';
import 'package:todoapp_riverpod/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: 'Aug 7, 2024',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    DisplayWhiteText(
                      text: 'My Todo List',
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
                    const DisplayListOfTasks(
                      tasks: [
                        Task(
                          title: 'title',
                          note: 'note',
                          time: 'time',
                          date: 'date',
                          isCompleted: false,
                          category: TaskCategories.work,
                        ),
                        Task(
                          title: 'title',
                          note: 'note',
                          time: 'time',
                          date: 'date',
                          isCompleted: false,
                          category: TaskCategories.education,
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    const DisplayListOfTasks(
                      tasks: [
                        Task(
                          title: 'title',
                          note: '',
                          time: 'time',
                          date: 'date',
                          isCompleted: true,
                          category: TaskCategories.work,
                        ),
                        Task(
                          title: 'title',
                          note: 'note',
                          time: 'time',
                          date: 'date',
                          isCompleted: true,
                          category: TaskCategories.education,
                        ),
                      ],
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(
                          text: 'Add New Task',
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
}
