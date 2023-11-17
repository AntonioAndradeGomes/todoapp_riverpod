import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_riverpod/utils/task_categories.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategories>((ref) {
  return TaskCategories.others;
});
