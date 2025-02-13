import 'package:task_cubit/models/task_model.dart';

abstract class StatesToDoList {}

class InitialState extends StatesToDoList {}

class LoadingAddTaskState extends StatesToDoList {}

class SuccessfullyAddTaskState extends StatesToDoList {
 // final List<TaskModel> tasks;
  SuccessfullyAddTaskState();
}

class GetEmptyListState extends StatesToDoList {}

class ErrorAddTaskState extends StatesToDoList {
  final String errorMessage;
  ErrorAddTaskState(this.errorMessage);
}



class GetSuccessfullyListState extends StatesToDoList {
  final List<TaskModel> getTasks;
  GetSuccessfullyListState(this.getTasks);
}
class LoadingListState extends StatesToDoList {}



class ErrorListState extends StatesToDoList {
  final String errorMessage;
  ErrorListState(this.errorMessage);
}

class TaskDeletedState extends StatesToDoList {
 // final List<TaskModel> updatedTasks;

  TaskDeletedState();
}
class TaskRemoveLoading extends StatesToDoList {

}
class TaskRemoveError extends StatesToDoList{
  final String errorMessage;
  TaskRemoveError(this.errorMessage);

}
