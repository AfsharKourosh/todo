import 'package:todo/core/usecase/base_use_case.dart';

import '../entity/todo_entity.dart';
import '../repository/todo_repository.dart';

class AddTodo implements BaseUseCase<void, TodoEntity> {
  final TodoRepository repository;

  AddTodo(this.repository);

  @override
  Future call(TodoEntity todo) async {
    return repository.addTodo(todo);
  }
}
