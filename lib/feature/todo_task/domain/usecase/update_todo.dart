import 'package:todo/core/usecase/base_use_case.dart';
import '../entity/todo_entity.dart';
import '../repository/todo_repository.dart';

class UpdateTodo implements BaseUseCase<void, TodoEntity> {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  @override
  Future<void> call(TodoEntity todo) async {
    await repository.updateTodo(todo);
  }
}
