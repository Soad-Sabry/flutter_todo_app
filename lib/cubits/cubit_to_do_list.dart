import 'package:flutter_bloc/flutter_bloc.dart';
import 'states_to_do_list.dart';

class TaskCubit extends Cubit<StatesToDoList> {
  TaskCubit() : super(TodoLoadedState([]));

  List<String> tasks = [];

  void AddTask(String task) {
    tasks.add(task);
    emit(TodoLoadedState(List.from(tasks)));
  }
}
