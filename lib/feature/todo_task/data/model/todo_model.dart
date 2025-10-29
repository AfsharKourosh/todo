import 'package:hive/hive.dart';
import '../../domain/entity/todo_entity.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends TodoEntity {
  @HiveField(1)
  @override
  final String id;

  @HiveField(1)
  @override
  final bool isDone;

  @HiveField(2)
  @override
  final String title;

  const TodoModel({required this.id, required this.title, required this.isDone})
    : super(id: id, title: title, isDone: isDone);

  factory TodoModel.fromEntity(TodoEntity entity) {
    return TodoModel(id: entity.id, title: entity.title, isDone: entity.isDone);
  }

  TodoEntity toEntity() {
    return TodoEntity(id: id, title: title, isDone: isDone);
  }
}
