import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_riverpod/providers/task/task_state.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  TaskNotifier(super.state);
}
