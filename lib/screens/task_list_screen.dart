import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lista_de_tareas/providers/task_provider.dart';
import 'package:lista_de_tareas/widgets/task_list.dart';

class TaskListScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: TaskList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration:
                        const InputDecoration(labelText: 'Nueva Tareas'),
                    onSubmitted: (value) {
                      final newTask = value;
                      if (newTask.isNotEmpty) {
                        Provider.of<TaskProvider>(context, listen: false)
                            .addTask(newTask);
                        _taskController.clear();
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final newTask = _taskController.text;
                    if (newTask.isNotEmpty) {
                      Provider.of<TaskProvider>(context, listen: false)
                          .addTask(newTask);
                      _taskController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
