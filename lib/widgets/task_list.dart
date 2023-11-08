import 'package:flutter/material.dart';
import 'package:lista_de_tareas/widgets/task_list_item.dart';
import 'package:provider/provider.dart';
import 'package:lista_de_tareas/providers/task_provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TaskProvider>(context);

    return ListView.builder(
      itemCount: tasksProvider.tasks.length,
      itemBuilder: (context, index) {
        final task = tasksProvider.tasks[index];
        return TaskListItem(task: task, index: index);
      },
    );
  }
}
