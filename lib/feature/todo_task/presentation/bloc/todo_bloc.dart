import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/usecase/no_param.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entity/todo_entity.dart';
import '../../domain/usecase/add_todo.dart';
import '../../domain/usecase/delete_todo.dart';
import '../../domain/usecase/get_todo.dart';
import '../../domain/usecase/update_todo.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodo getTodo;

  final AddTodo addTodo;
  final UpdateTodo updateTodo;

  final DeleteTodo deleteTodo;

  TodoBloc({
    required this.getTodo,
    required this.addTodo,
    required this.updateTodo,
    required this.deleteTodo,
  }) : super(TodoInitial()) {
    on<GetTodosEvent>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await getTodo(NoParam());
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });
    on<AddTodoEvent>((event, emit) async {
      final currentState = state;
      if (currentState is TodoLoaded) {
        final newTodo = TodoEntity(
          id: const Uuid().v4(),
          title: event.title,
          isDone: false,
        );
        await addTodo(newTodo);
        final todos = await getTodo(NoParam());

        emit(TodoLoaded(todos));
      }
    });

    on<UpdateTodoEvent>((event, emit) async {
      await updateTodo(event.todo);
      final todos = await getTodo(NoParam());
      emit(TodoLoaded(todos));
    });

    on<DeleteTodoEvent>((event, emit) async {
      await deleteTodo(event.id);
      final todos = await getTodo(NoParam());
      emit(TodoLoaded(todos));
    });
  }
}
