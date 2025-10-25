

import '../entity/todo_entity.dart';
import '../repository/todo_repository.dart';

class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<void> call(TodoEntity todo) async {
    await repository.addTodo(todo);
  }
}
