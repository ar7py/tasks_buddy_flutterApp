import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks_buddy/widgets/tasks_list.dart';
import 'package:tasks_buddy/screens/add_tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:tasks_buddy/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  static const String id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4e75bf),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF4e75bf),
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                child: AddTasksScreen(),
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              ),
            )
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 50.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 45.0,
                    color: Color(0xFF4e75bf),
                  ),
                  backgroundColor: Colors.white,
                  radius: 32.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: const [
                    Text(
                      'Tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 35.0,
                    ),
                    Image(
                      alignment: Alignment.topRight,
                      image: AssetImage('images/bg.png'),
                      height: 100.0,
                      width: 100.0,
                    ),
                  ],
                ),
                 Text(
                  '${Provider.of<TaskData>(context).tasks.length} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
