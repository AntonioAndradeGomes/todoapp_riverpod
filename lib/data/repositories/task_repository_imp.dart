import 'package:todoapp_riverpod/data/datasource/datasource.dart';
import 'package:todoapp_riverpod/data/models/models.dart';
import 'package:todoapp_riverpod/data/repositories/task_repository.dart';

class TaskRepositoryImp implements TaskRepository {
  final TaskDatasource datasource;

  TaskRepositoryImp(
    this.datasource,
  );

  @override
  Future<void> createTask(Task task) async {
    try {
      await datasource.addTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      await datasource.deleteTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      return await datasource.getAllTasks();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      await datasource.updateTask(task);
    } catch (e) {
      throw '$e';
    }
  }
}
