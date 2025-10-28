import 'package:todo/core/usecase/base_use_case.dart';
import 'package:todo/core/usecase/no_param.dart';
import '../entity/todo_entity.dart';
import '../repository/todo_repository.dart';

class GetTodo implements BaseUseCase<List<TodoEntity>, NoParam> {
  final TodoRepository repository;

  GetTodo(this.repository);

  @override
  Future<List<TodoEntity>> call(NoParam param) async {
    return await repository.getTodo();
  }
}
