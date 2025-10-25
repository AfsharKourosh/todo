

import 'package:todo/feature/add_task/domain/entity/todo_entity.dart';

import '../../domain/repository/todo_repository.dart';
import '../datasource/todo_datasource.dart';
import '../model/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTodo(TodoEntity todo) async {
    await localDataSource.addTodo(TodoModel.fromEntity(todo));
  }

  @override
  Future<void> deleteTodo(String id) async {
    await localDataSource.deleteTodo(id);
  }

  Future<List<TodoEntity>> getTodos() async {
    final todos = await localDataSource.getTodos();
    return todos.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> updateTodo(TodoEntity todo) async {
    await localDataSource.updateTodo(TodoModel.fromEntity(todo));
  }

  @override
  Future<List<TodoEntity>> getTodo() {

    throw UnimplementedError();
  }
}
