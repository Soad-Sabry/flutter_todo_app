import 'package:flutter/src/material/time.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_cubit/models/task_model.dart';
import 'package:task_cubit/repos/repo.dart';
import 'states_to_do_list.dart';

class TaskCubit extends Cubit<StatesToDoList> {
  TaskCubit() : super(InitialState()) ;

  static TaskCubit get(context)=>BlocProvider.of(context);
  MainRepoImp mainRepoImp=MainRepoImp();

  TimeOfDay? timeOfDay;

  void addTask(String newTask, TimeOfDay timeOfDay,) {
      emit(LoadingAddTaskState());
        mainRepoImp.addTask(newTask, timeOfDay).fold(
                (String error)
            {
              emit(ErrorAddTaskState(error));

            },
            (tasks){
              emit(SuccessfullyAddTaskState());
              getList();


            });






  }
  void removeTask(int index) {
    mainRepoImp.removeTask(index).fold(
            (error) {
          emit(TaskRemoveError(error.toString()));
        },
            (tasks) {
          if (tasks.isEmpty) {
            emit(InitialState()); // إذا كانت القائمة فارغة، العودة للحالة الأولية
          } else {
            emit(TaskDeletedState());
            getList(); // تأكد من استدعاء getList لتحديث القائمة بعد الحذف
          }
        }
    );
  }

  // void removeTask(int index) {
  //
  //   mainRepoImp.removeTask(index).fold(
  //       (tasks){
  //         if(tasks.isEmpty) {
  //           emit(InitialState());
  //         }
  //       else {
  //       emit(TaskDeletedState());
  //     //  getList();
  //       }
  //
  //
  //   },(error){
  //
  //     emit(TaskRemoveError(error.toString()));
  //   },
  //   );
  //
  //
  //
  //   }

  void getList() {
    emit(LoadingListState());
    mainRepoImp.getList().fold(
            (String error){
              emit(ErrorListState(error));
              },
            (tasks){
              if(tasks.isEmpty)
                {
                        emit(GetEmptyListState());

                }
              else{
                emit(GetSuccessfullyListState(tasks));

              }
    });
  }
}







