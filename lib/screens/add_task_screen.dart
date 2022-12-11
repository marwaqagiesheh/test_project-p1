import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/models/task_data.dart';


class AddTaskScreen extends StatefulWidget {
  final Function addTaskCallback;

  AddTaskScreen(this.addTaskCallback);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime data = DateTime(8-11-2022);

  get actions => null;

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.indigo[400],
                fontWeight: FontWeight.bold,

              )),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;


            },
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle!);
              Navigator.pop(context);
            },
            child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.send),
          )
          ),

          TextButton(
            onPressed: () async {
              DateTime? newData = await showDatePicker(
                  context: context,
                  initialDate:  DateTime.now(),
                  firstDate: DateTime (2000),
                  lastDate: DateTime (2101)
              );
              if (newData == null) return;
              setState(() => data =newData);
            },
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.calendar_month),
        ),

          ),

      ]
      ),
    );
  }
}

