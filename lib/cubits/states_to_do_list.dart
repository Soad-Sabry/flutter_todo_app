abstract class StatesToDoList{}


class TodoLoadedState extends StatesToDoList{
  final List<String> tasks;
  TodoLoadedState(this.tasks);

}
