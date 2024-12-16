import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/task_model.dart';

class TaskViewmodel extends ChangeNotifier {
  final TaskModel _model = TaskModel();

  List<Task> getTasks() => _model.tasks;

  void addTask(Task task) {
    _model.addTask(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _model.removeTask(index);
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    _model.toggleTaskStatus(index);
    notifyListeners();
  }
}
