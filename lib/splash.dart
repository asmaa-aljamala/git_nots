import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/provider.dart';
import 'package:todo2/todo.dart';



class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Provider.of<DatabaseProvider>(context, listen: false).getAllTasks();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return TodoApp();
      }));
    });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(
                  'asset/image/img1.png',),
        ),
      ),
    );
  }
}
