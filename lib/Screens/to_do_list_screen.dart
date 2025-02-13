import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_cubit/models/task_model.dart';
import '../cubits/cubit_to_do_list.dart';
import '../cubits/states_to_do_list.dart';
import 'add_task.dart';

class TodoListScreen extends StatelessWidget {
  List<TaskModel>tasks=[];

  TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("To Do List",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.purple
            ),
          ),
      ),
     body: BlocConsumer<TaskCubit, StatesToDoList>(
       listener: (context, state) {},
        builder: (context, state) {

          if (state is GetSuccessfullyListState) {
            final tasks = state.getTasks;

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   // color: Color(0xFFF5F5F5),
                      decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width:1),
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                    child: ListTile(

                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tasks[index].taskName,

                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${tasks[index].taskTime.hour}:${tasks[index].taskTime.minute}",
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),

                        leading: const Icon(Icons.check_box_outline_blank,
                          size: 25,
                        ),

                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          context.read<TaskCubit>().removeTask(index);
                        },
                      ),
                    ),
                  ),
                );
              },

            ) ;

          }



          else if (state is LoadingListState) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is ErrorListState) {
            return Center(
              child: Text(
                "Error: ${state.errorMessage}",

                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          else  {
            return const Center(
              child: Text("List is Empty",style: TextStyle(
                fontSize: 25,
              ),),
            );

          }


        },
     ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
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
