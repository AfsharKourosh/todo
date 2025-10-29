import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/todo_entity.dart';
import '../bloc/todo_bloc.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key, required this.todo});
  final TodoEntity todo;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: todo.title);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Add Todo', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Todo Title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter todo title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                final updatedTitle = controller.text;
                if (updatedTitle.isNotEmpty) {
                 final updatedTodo=TodoEntity(id: todo.id, title: updatedTitle);
                 context.read<TodoBloc>().add(UpdateTodoEvent(updatedTodo));
                 Navigator.pop(context, true);

                }
              },
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
