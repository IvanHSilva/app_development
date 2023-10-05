import 'package:app_development/app02/models/tasklist.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key, required this.task});

  final TaskList task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('dd/MM/yyyy HH:mm').format(task.date),
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            task.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
