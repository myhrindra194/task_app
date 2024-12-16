class Task {
  String title;
  String description;
  bool isCompleted;

  Task(
      {required this.title,
      required this.description,
      this.isCompleted = false});
}

class TaskModel {
  final List<Task> _tasks = [
    Task(title: "Sleep", description: "I am here"),
    Task(title: "Test", description: "Test description", isCompleted: true)
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
  }

  void toggleTaskStatus(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
  }
}
