
import '../entity/todo_entity.dart';
import '../repository/todo_repository.dart';

class GetTodo {
  final TodoRepository repository;

  GetTodo(this.repository);

  Future<List<TodoEntity>> call() async {
    return await repository.getTodo();
  }
}
