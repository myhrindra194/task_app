import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/task_view.dart';
import 'package:flutter_application_1/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskViewmodel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskView(),
      ),
    );
  }
}
