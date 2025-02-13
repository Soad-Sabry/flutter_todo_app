import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/to_do_list_screen.dart';
import 'cubits/cubit_to_do_list.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskCubit()..getList())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoListScreen(),
      ),
    );
  }
}
