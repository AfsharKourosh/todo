part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object?> get props => [];
}

class GetTodosEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final String title;

  const AddTodoEvent(this.title);

  @override
  List<Object?> get props => [title];
}

class UpdateTodoEvent extends TodoEvent {
  final TodoEntity todo;

  const UpdateTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo];
}

class DeleteTodoEvent extends TodoEvent {
  final String id;

  const DeleteTodoEvent(this.id);

  @override
  List<Object?> get props => [id];
}
