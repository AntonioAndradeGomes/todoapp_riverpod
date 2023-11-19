import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_riverpod/providers/providers.dart';

import '../../data/repositories/repositories.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
