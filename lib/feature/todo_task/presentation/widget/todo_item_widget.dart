import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/feature/todo_task/presentation/screen/add_todo_page.dart';
import '../../domain/entity/todo_entity.dart';
import '../bloc/todo_bloc.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoEntity todo;

  const TodoItemWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            todo.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            color: todo.isDone ? Colors.blueAccent : Colors.grey,
          ),
          onPressed: () {
            final updated = todo.copyWith(isDone: !todo.isDone);
            context.read<TodoBloc>().add(UpdateTodoEvent(updated));
          },
        ),
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddTodoPage(todo: todo),
                  ),
                );
              },
            ),
            SizedBox(width: 10.0),
            Text(
              todo.title,
              style: TextStyle(
                fontSize: 16,
                decoration: todo.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: () {
            context.read<TodoBloc>().add(DeleteTodoEvent(todo.id));
          },
        ),
      ),
    );
  }
}
