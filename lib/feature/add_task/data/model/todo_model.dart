import 'package:hive/hive.dart';

import '../../domain/entity/todo_entity.dart';


part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final bool isDone;

  TodoModel({
    required this.id,
    required this.title,
    required this.isDone,
  });

  // تبدیل از Entity به Model
  factory TodoModel.fromEntity(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      title: entity.title,
      isDone: entity.isDone,
    );
  }

  // تبدیل از Model به Entity
  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      title: title,
      isDone: isDone,
    );
  }
}
