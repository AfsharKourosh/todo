import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/di/service_locator.dart';
import 'package:todo/feature/todo_task/presentation/bloc/todo_bloc.dart';
import 'feature/todo_task/presentation/screen/todo_list_screen.dart';

void main() async {
  await initDependencies();
  runApp(
    BlocProvider(create: (context) => TodoBloc(getTodo: sl(), addTodo: sl(), updateTodo: sl(), deleteTodo: sl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen()

      ),
    ),
  );
}
