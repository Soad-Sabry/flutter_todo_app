import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';

abstract class MainRepo{
  void addTask(String newTask, TimeOfDay timeOfDay,) ;
  void removeTask(int index) ;
  Either<String, List<TaskModel>>getList();


  }

class MainRepoImp extends MainRepo{
  List<TaskModel> taskListModel =[];

  @override
  Either<String,void> addTask(String newTask, TimeOfDay timeOfDay) {
    try{
      TaskModel task=TaskModel(taskName: newTask, taskTime: timeOfDay);
      taskListModel.add(task);
      print("**************$task");
      getList();
       return Right(taskListModel);

    }catch(e){
     return Left(e.toString());
    }
  }

  @override
  Either<String,List<TaskModel>> removeTask(int index) {
    try {
      print(index);
      taskListModel.removeAt(index);
      print(index);

        print("**************$taskListModel");

        return Right(taskListModel);

    } catch (e) {
      return Left(e.toString());
    }


  }

  @override
  Either<String, List<TaskModel>>getList() {

    try {
    return Right(taskListModel);
    } catch (e) {
      return Left(e.toString());

    }

  }

  }