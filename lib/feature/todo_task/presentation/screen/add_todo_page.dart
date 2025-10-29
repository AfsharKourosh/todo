import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/feature/todo_task/domain/entity/todo_entity.dart';
import '../bloc/todo_bloc.dart';

class AddTodoPage extends StatelessWidget {
  final TodoEntity? todo;

  const AddTodoPage({super.key, this.todo});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: todo?.title ?? '');
    final isEdit = todo != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          isEdit ? 'Edit Todo' : 'Add Todo',
          style: TextStyle(color: Colors.white),
        ),
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
                final title = controller.text;

                if (isEdit) {
                  if (title.isNotEmpty) {
                    final updatedTitle = controller.text;

                    final updatedTodo = TodoEntity(
                      id: todo!.id,
                      title: updatedTitle,
                    );
                    context.read<TodoBloc>().add(UpdateTodoEvent(updatedTodo));
                    Navigator.pop(context, updatedTodo);
                  }
                } else {
                  if (title.isNotEmpty) {
                    context.read<TodoBloc>().add(AddTodoEvent(title));
                    Navigator.pop(context, title);
                  }
                }
              },
              child: Text(
                isEdit ? 'Save' : 'Add',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
