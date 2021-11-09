import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_buddy/models/task_data.dart';

class AddTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(35.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                 Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xFF4e75bf),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                  ),
                ),
                Image(image: AssetImage('images/bg.png'),
                height: 56.0,
                  width: 56.0,
                ),
              ],
            ),
             TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newTask) {
                newTaskTitle = newTask;
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            FlatButton(
              height: 45.0,
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                Navigator.pop(context);
              },
              child: const Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              color: const Color(0xFF49b249),
            ),
          ],
        ),
      ),
    );
  }
}
