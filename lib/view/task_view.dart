// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/task_model.dart';
import 'package:flutter_application_1/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => TaskViewState();
}

class TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskViewmodel>(context);
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();

    void _addTask() {
      String title = _titleController.text;
      String description = _descriptionController.text;
      if (title.isNotEmpty && description.isNotEmpty) {
        tasks.addTask(Task(title: title, description: description));
      }
      _titleController.clear();
      _descriptionController.clear();
      Navigator.of(context).pop();
    }

    void _showDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Add task'),
              content: const Text('All fields are required'),
              actions: <Widget>[
                TextField(
                  controller: _titleController, // Premier champ de saisie
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller:
                      _descriptionController, // Deuxième champ de saisie
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Close the dialog when pressed
                      },
                      child: const Text('Close'),
                    ),
                    FilledButton(
                        onPressed: () => _addTask(),
                        child: const Text("Add task"))
                  ],
                )
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Task App"),
        leading: const Icon(Icons.safety_check),
        backgroundColor: const Color.fromARGB(102, 94, 115, 234),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: tasks.getTasks().length,
                      itemBuilder: (context, index) {
                        final task = tasks.getTasks()[index];
                        return (Card(
                          child: ListTile(
                            title: Text(task.title),
                            subtitle: Text(task.description),
                            trailing: const Icon(Icons.check),
                          ),
                        ));
                      })),
              FloatingActionButton(
                onPressed: () => _showDialog(context),
                child: const Icon(Icons.add),
              )
            ],
          )),
    );
  }
}
