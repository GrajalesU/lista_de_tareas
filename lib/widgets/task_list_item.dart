import 'package:flutter/material.dart';
import 'package:lista_de_tareas/models/task_model.dart';
import 'package:lista_de_tareas/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final int index;

  const TaskListItem({required this.task, required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (_) {
          Provider.of<TaskProvider>(context, listen: false).toggleTask(index);
        },
      ),
    );
  }
}
