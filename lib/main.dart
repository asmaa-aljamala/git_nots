import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/provider.dart';
import 'package:todo2/splash.dart';
import 'package:todo2/task_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TaskDbHelper.taskDbHelper.initializeTasksDatabase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DatabaseProvider>(
      create: (context) {
        return DatabaseProvider();
      },
      child: MaterialApp(
        home: SplachScreen(),
      ),
    );
  }
}
