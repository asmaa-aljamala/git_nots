import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/provider.dart';
import 'package:todo2/todo_model.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  bool isComplete = false;

  String taskName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('New Reminder'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    maxLines: 15,
                    decoration: InputDecoration(border: InputBorder.none),
                    onChanged: (value) {
                      taskName = value;
                    },
                  ),
                ),
              ],
            ),
            Container(
              width: 150,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.red,
                  child: Text('save', style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    Task task =
                        Task(taskName: taskName, isComplete: isComplete);
                    await Provider.of<DatabaseProvider>(context, listen: false)
                        .insertIntoDatabse(task);
                    // await context
                    //     .read<DatabaseProvider>()
                    //     .insertIntoDatabse(task);

                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
