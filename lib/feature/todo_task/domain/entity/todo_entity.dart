import 'package:equatable/equatable.dart';
import '../../data/model/todo_model.dart';

class TodoEntity extends Equatable {
  final String id;
  final String title;
  final bool isDone;

  const TodoEntity({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  TodoModel copyWith({String? id, String? title, bool? isDone}) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [id, title, isDone];
}
