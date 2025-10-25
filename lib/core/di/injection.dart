import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../feature/add_task/data/datasource/todo_datasource.dart';
import '../../feature/add_task/data/model/todo_model.dart';
import '../../feature/add_task/data/repository/todo_repository.dart';
import '../../feature/add_task/domain/repository/todo_repository.dart';
import '../../feature/add_task/domain/usecase/add_todo.dart';
import '../../feature/add_task/domain/usecase/delete_todo.dart';
import '../../feature/add_task/domain/usecase/get_todo.dart';
import '../../feature/add_task/domain/usecase/update_todo.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // ✅ 1. Init Hive
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  final todoBox = await Hive.openBox<TodoModel>('todos');

  // ✅ 2. Data Sources
  sl.registerLazySingleton<TodoLocalDataSource>(
        () => TodoLocalDataSourceImpl(todoBox),
  );

  // ✅ 3. Repository
  sl.registerLazySingleton<TodoRepository>(
        () => TodoRepositoryImpl(sl()),
  );

  // ✅ 4. Use Cases
  sl.registerLazySingleton(() => GetTodo(sl()));
  sl.registerLazySingleton(() => AddTodo(sl()));
  sl.registerLazySingleton(() => UpdateTodo(sl()));
  sl.registerLazySingleton(() => DeleteTodo(sl()));
}
