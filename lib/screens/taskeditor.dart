import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/objectbox.g.dart';

class TaskEditorScreen extends StatefulWidget {
  const TaskEditorScreen({Key? key}) : super(key: key);

  @override
  State<TaskEditorScreen> createState() => _TaskEditorScreenState();
}

class _TaskEditorScreenState extends State<TaskEditorScreen> {

Box<TaskModel>taskBox = objectBox.store.box<TaskModel>();

final TextEditingController _taskTitleController = TextEditingController();
final TextEditingController _taskDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: const Text('Create A New Task'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(
                  "Task Title",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
               const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _taskTitleController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 40, 40, 40),
                    filled : true,
                    hintStyle: const TextStyle(color: Color.fromARGB(255, 145, 145, 145)),
                    hintText: "Type Your Task Title",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),

                    )
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Task Description",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
               const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _taskDescriptionController,
                  style: const TextStyle(color: Colors.white),
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 40, 40, 40),
                    filled : true,
                    hintStyle: const TextStyle(color: Color.fromARGB(255, 145, 145, 145)),
                    hintText: "Type Your Task Description",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),

                    )
                  ),
                ),
                  const SizedBox(
                    height: 15,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: (){
                        String taskTitle = _taskTitleController.text;
                        String taskDescription = _taskDescriptionController.text; 
                        TaskModel model = TaskModel(
                          taskTitle: taskTitle ,
                          taskDescription: taskDescription ,
                          taskDone: false, 
                          creationDate: DateTime.now()
                          );
                          taskBox.put(model);
                          Navigator.pop(context);
                      
                      },
                      color: Colors.yellow,
                      elevation: 0.0,
                      child: const Text("Save Task",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        

                       ),),
                      )
                  ],
                )

              ],
            ),
          ),
        ));
  }
}
