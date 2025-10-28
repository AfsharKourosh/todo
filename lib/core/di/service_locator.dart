import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/feature/todo_task/presentation/bloc/todo_bloc.dart';
import '../../feature/todo_task/data/datasource/local/todo_datasource.dart';
import '../../feature/todo_task/data/model/todo_model.dart';
import '../../feature/todo_task/data/repository/todo_repository.dart';
import '../../feature/todo_task/domain/repository/todo_repository.dart';
import '../../feature/todo_task/domain/usecase/add_todo.dart';
import '../../feature/todo_task/domain/usecase/delete_todo.dart';
import '../../feature/todo_task/domain/usecase/get_todo.dart';
import '../../feature/todo_task/domain/usecase/update_todo.dart';


  GetIt sl = GetIt.instance;

  Future<void> initDependencies() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoModelAdapter());
    final todoBox = await Hive.openBox<TodoModel>('todos');
    sl.registerLazySingleton<Box<TodoModel>>(() => todoBox);
    //Hive
    sl.registerLazySingleton<TodoDataSource>(
          () => (TodoLocalDataSourceImpl(sl<Box<TodoModel>>())),
    );

    //Repository
    sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));
    //UseCase
    sl.registerLazySingleton(() => GetTodo(sl()));
    sl.registerLazySingleton(() => AddTodo(sl()));
    sl.registerLazySingleton(() => UpdateTodo(sl()));
    sl.registerLazySingleton(() => DeleteTodo(sl()));
    //bloc
    sl.registerLazySingleton<TodoBloc>(() =>
        TodoBloc(
            getTodo: sl(), addTodo: sl(), updateTodo: sl(), deleteTodo: sl()),);
  }
