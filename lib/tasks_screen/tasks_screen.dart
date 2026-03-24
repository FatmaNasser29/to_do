import 'package:flutter/material.dart';
import 'package:to_do/tasks_screen/task_card.dart';

class TasksScreen extends StatelessWidget {
  static const String routeName = "tasksScreen";

  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [TaskCard(), TaskCard()]);
  }
}
