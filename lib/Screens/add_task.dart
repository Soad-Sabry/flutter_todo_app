import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cubit_to_do_list.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController taskController = TextEditingController();
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Task", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 8,
            shadowColor: Colors.purple.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task Name",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: "Enter task...",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.purple, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Text(
                    "Select Time",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),

                  GestureDetector(
                    onTap: () => _pickTime(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.purple, width: 1.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedTime == null
                                ? "Tap to choose time"
                                : selectedTime!.format(context),
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.access_time, color: Colors.purple),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () {
                      if (taskController.text.isNotEmpty && selectedTime != null) {
                        context.read<TaskCubit>().addTask(
                          taskController.text,
                          selectedTime!,
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Add Task",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
}
