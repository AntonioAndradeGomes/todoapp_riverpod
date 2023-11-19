import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp_riverpod/data/data.dart';
import 'package:todoapp_riverpod/utils/utils.dart';

class TaskDatasource {
  static final TaskDatasource _instance = TaskDatasource._();
  factory TaskDatasource() => _instance;

  TaskDatasource._() {
    _initDB();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(
      dbPath,
      BdKeys.dbName,
    );
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(
    Database db,
    int version,
  ) async {
    await db.execute(
      '''
          CREATE TABLE ${BdKeys.dbTable}(
            ${BdKeys.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${BdKeys.titleColumn} TEXT,
            ${BdKeys.noteColumn} TEXT,
            ${BdKeys.dateColumn} TEXT,
            ${BdKeys.timeColumn} TEXT,
            ${BdKeys.categoryColumn} TEXT,
            ${BdKeys.isCompletedColumn} INTEGER
          )
      ''',
    );
  }

  Future<int> addTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        BdKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        BdKeys.dbTable,
        task.toJson(),
        where: 'id = ?',
        whereArgs: [
          task.id,
        ],
      );
    });
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(
        BdKeys.dbTable,
        where: 'id = ?',
        whereArgs: [
          task.id,
        ],
      );
    });
  }

  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> data = await db.query(
      BdKeys.dbTable,
      orderBy: 'id DESC',
    );

    return List.generate(
      data.length,
      (index) => Task.fromJson(
        data[index],
      ),
    );
  }
}
