import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_riverpod/data/data.dart';

final taskDatasourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});
