import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../widget/todo_item_widget.dart';
import 'add_todo_page.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc()..add(GetTodosEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'My Todos 📝',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TodoLoaded) {
              final todos = state.todos;
              if (todos.isEmpty) {
                return const Center(child: Text('هیچ کاری اضافه نکردی 😌'));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return TodoItemWidget(todo: todo);
                },
              );
            } else if (state is TodoError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () async {
            // رفتن به صفحه AddTodo و صبر برای برگشت
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<TodoBloc>(),
                  child: const AddTodoPage(),
                ),
              ),
            );

            // اگر کاربر واقعا تسک اضافه کرد، فقط اون موقع لیست رو آپدیت کن
            if (result == true) {
              context.read<TodoBloc>().add(GetTodosEvent());
            }
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),

      ),
    );
  }
}
