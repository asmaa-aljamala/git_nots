import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo2/provider.dart';
import 'package:todo2/todo_model.dart';

class TodoWidget extends StatelessWidget {
  Task task;
  TodoWidget(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.taskName),
        leading: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // context.read<DatabaseProvider>().deleteTask(task);
              Provider.of<DatabaseProvider>(context, listen: false)
                  .deleteTask(task);
            }),
        trailing: Checkbox(
          value: task.isComplete,
          onChanged: (value) {
            // context.read<DatabaseProvider>().updateTask(task);
            Provider.of<DatabaseProvider>(context, listen: false)
                .updateTask(task);
          },
        ),
      ),
    );
  }
}
