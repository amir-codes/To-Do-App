import 'package:flutter/material.dart';
import 'package:todaydo_app/wigets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todaydo_app/models/tasks_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, tasksData, child) {
        return ListView.builder(
            itemCount: tasksData.tasks.length,
            itemBuilder: (context, index) {
              return TaskTile(
                isChecked: tasksData.tasks[index].isDone,
                taskTitle: tasksData.tasks[index].name,
                checkboxchange: (newvalue) {
                  tasksData.updateTask(tasksData.tasks[index]);
                },
                listTileDelete: () {
                  tasksData.deleteTask(tasksData.tasks[index]);
                },
              );
            });
      },
    );
  }
}
