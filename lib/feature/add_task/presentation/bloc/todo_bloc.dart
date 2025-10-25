import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';


import '../../../../core/di/injection.dart';
import '../../domain/entity/todo_entity.dart';
import '../../domain/usecase/add_todo.dart';
import '../../domain/usecase/delete_todo.dart';
import '../../domain/usecase/get_todo.dart';
import '../../domain/usecase/update_todo.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodo getTodo = sl<GetTodo>();
  final AddTodo addTodo = sl<AddTodo>();
  final UpdateTodo updateTodo = sl<UpdateTodo>();
  final DeleteTodo deleteTodo = sl<DeleteTodo>();

  TodoBloc() : super(TodoInitial()) {
    on<GetTodosEvent>(_onGetTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  Future<void> _onGetTodos(
      GetTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final todos = await getTodo();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onAddTodo(
      AddTodoEvent event, Emitter<TodoState> emit) async {
    final currentState = state;
    if (currentState is TodoLoaded) {
      final newTodo = TodoEntity(
        id: const Uuid().v4(),
        title: event.title,
        isDone: false,
      );
      await addTodo(newTodo);
      final todos = await getTodo();
      emit(TodoLoaded(todos));
    }
  }

  Future<void> _onUpdateTodo(
      UpdateTodoEvent event, Emitter<TodoState> emit) async {
    await updateTodo(event.todo);
    final todos = await getTodo();
    emit(TodoLoaded(todos));
  }

  Future<void> _onDeleteTodo(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    await deleteTodo(event.id);
    final todos = await getTodo();
    emit(TodoLoaded(todos));
  }
}
