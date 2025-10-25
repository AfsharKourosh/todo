import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String id;
  final String title;
  final bool isDone;

  const TodoEntity({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  TodoEntity copyWith({
    String? id,
    String? title,
    bool? isDone,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [id, title, isDone];
}
