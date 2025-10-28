import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/di/service_locator.dart';
import 'package:todo/feature/todo_task/presentation/bloc/todo_bloc.dart';
import 'feature/app/main_screen.dart';

void main() async {
  await initDependencies();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (_) =>sl<TodoBloc>())
      ], child: MainScreen()),
    ),
  );
}
