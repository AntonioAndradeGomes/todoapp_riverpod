import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_riverpod/data/repositories/repositories.dart';
import 'package:todoapp_riverpod/providers/task/task_state.dart';

import '../../data/models/models.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository repository;
  TaskNotifier(
    this.repository,
  ) : super(
          const TaskState.initial(),
        ) {
    getTasks();
  }

  Future<void> createTask(Task task) async {
    try {
      await repository.createTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await repository.deleteTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isCompleted = !task.isCompleted;
      final updatedTask = task.copyWith(
        isCompleted: isCompleted,
      );
      await repository.updateTask(
        updatedTask,
      );
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getTasks() async {
    try {
      final tasks = await repository.getAllTasks();
      state = state.copyWith(
        tasks: tasks,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
