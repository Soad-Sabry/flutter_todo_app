import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cubit_to_do_list.dart';

class AddTaskPage extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(labelText: "Add task"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  context.read<TaskCubit>().AddTask(taskController.text);
                  Navigator.pop(context);
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
