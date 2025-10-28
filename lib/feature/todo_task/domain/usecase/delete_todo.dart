import 'package:todo/core/usecase/base_use_case.dart';
import '../repository/todo_repository.dart';

class DeleteTodo implements BaseUseCase<void, String> {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  @override
  Future<void> call(String id) async {
    await repository.deleteTodo(id);
  }
}
