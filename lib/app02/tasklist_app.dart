import 'package:app_development/app02/models/tasklist.dart';
import 'package:app_development/app02/widgets/tasklistitem.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskListApp extends StatefulWidget {
  const TaskListApp({super.key});

  @override
  State<TaskListApp> createState() => _TaskListAppState();
}

class _TaskListAppState extends State<TaskListApp> {
  List<TaskList> tasks = [];

  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          labelStyle: TextStyle(fontSize: 20),
                        ),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        String currentTask = taskController.text;
                        setState(() {
                          TaskList newTask = TaskList(
                            title: currentTask,
                            date: DateTime.now(),
                          );
                          tasks.add(newTask);
                        });
                        taskController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(18),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (TaskList task in tasks)
                        TaskListItem(
                          task: task,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui ${tasks.length} tarefas pendentes',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(18),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Limpar',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
