import 'package:hive/hive.dart';
import '../../model/todo_model.dart';

abstract class TodoDataSource {
  Future<List<TodoModel>> getTodos();

  Future<void> addTodo(TodoModel todo);

  Future<void> updateTodo(TodoModel todo);

  Future<void> deleteTodo(String id);
}

class TodoLocalDataSourceImpl implements TodoDataSource {
  final Box<TodoModel> box;

  TodoLocalDataSourceImpl(this.box);

  @override
  Future<List<TodoModel>> getTodos() async {
    return box.values.toList();
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    await box.put(todo.id, todo);
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    await box.put(todo.id, todo);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await box.delete(id);
  }
}
