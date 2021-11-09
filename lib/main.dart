import 'package:flutter/material.dart';
import 'package:tasks_buddy/screens/welcome.dart';
import 'package:tasks_buddy/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:tasks_buddy/models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        home: WelcomeScreen(),
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          TasksScreen.id: (context) => TasksScreen(),
        },
      ),
    );
  }
}
