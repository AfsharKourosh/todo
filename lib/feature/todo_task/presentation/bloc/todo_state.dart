part of'todo_bloc.dart';


abstract class TodoState extends Equatable{

}

class TodoInitial extends TodoState {
  @override

  List<Object?> get props => [];
}

class TodoLoading extends TodoState {
  @override

  List<Object?> get props => [];
}

class TodoLoaded extends TodoState {
  final List<TodoEntity> todos;
  TodoLoaded(this.todos);

  @override

  List<Object?> get props => [todos];
}

class TodoError extends TodoState {
  final String message;
  TodoError(this.message);

  @override

  List<Object?> get props => [message];
}
