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
  TaskList? deletedTaskTitle;
  int? deletedTaskPosition;

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
                          onDelete: onDelete,
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
                      onPressed: confirmTaskListClear,
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

  void onDelete(TaskList task) {
    deletedTaskTitle = task;
    deletedTaskPosition = tasks.indexOf(task);

    setState(() {
      tasks.remove(task);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${task.title} removida com sucesso!',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.blue[900],
          onPressed: () {
            setState(() {
              tasks.insert(deletedTaskPosition!, deletedTaskTitle!);
            });
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void confirmTaskListClear() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar tarefas'),
        content: const Text('Deseja mesmo apagar todas as tarefas?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              clearTaskList();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue[900],
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  void clearTaskList() {
    setState(() {
      tasks.clear();
    });
  }
}
