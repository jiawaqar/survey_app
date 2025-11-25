import 'package:flutter/material.dart';
import 'question_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = [
      {"TaskID": 1, "TaskName": "Survey for Shop A"},
      {"TaskID": 2, "TaskName": "Survey for Shop B"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]["TaskName"].toString()),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      QuestionScreen(taskId: tasks[index]["TaskID"] as int),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
