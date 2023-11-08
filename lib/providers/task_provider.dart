import 'package:flutter/material.dart';
import 'package:lista_de_tareas/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String title) {
    tasks.add(Task(title: title));
    notifyListeners();
  }

  void toggleTask(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    notifyListeners();
  }
}
