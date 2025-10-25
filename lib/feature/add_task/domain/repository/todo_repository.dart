
import '../entity/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getTodo();
  Future<void> addTodo(TodoEntity todo);
  Future<void> updateTodo(TodoEntity todo);
  Future<void> deleteTodo(String id);
}
