import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cubit_to_do_list.dart';
import '../cubits/states_to_do_list.dart';
import 'add_task.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do List")),
      body: BlocBuilder<TaskCubit, StatesToDoList>(
        builder: (context, state) {
          if (state is TodoLoadedState) {
            final tasks = state.tasks;

            if (tasks.isEmpty) {
              return Center(child: Text("No tasks yet! Add a new task."));
            }

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  leading: Icon(Icons.check_box_outline_blank),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskPage(),
            ),
          );
        },
      ),
    );
  }
}
