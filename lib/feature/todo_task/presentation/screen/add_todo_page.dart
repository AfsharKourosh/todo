// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/todo_bloc.dart';
// import '../bloc/todo_event.dart';
//
// class AddTodoPage extends StatelessWidget {
//   const AddTodoPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController();
//
//     return BlocProvider.value(
//       value: context.read<TodoBloc>(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.blueAccent,
//           title: const Text('Add Todo', style: TextStyle(color: Colors.white)),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text(
//                 'Todo Title',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//               ),
//               const SizedBox(height: 12),
//               TextField(
//                 controller: controller,
//                 decoration: InputDecoration(
//                   hintText: 'Enter todo title',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 onPressed: () {
//                   final title = controller.text.trim();
//                   if (title.isNotEmpty) {
//                     context.read<TodoBloc>().add(AddTodoEvent(title));
//                     Navigator.pop(context,true);
//                   }
//                 },
//                 child: const Text('Add',
//                     style: TextStyle(fontSize: 16, color: Colors.white)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
