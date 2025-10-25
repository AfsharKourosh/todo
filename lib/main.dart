import 'package:flutter/material.dart';
import 'core/di/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(); // 🔥 اجرای init قبل از runApp()

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text('Todo App - Clean Architecture')),
      ),
    );
  }
}
