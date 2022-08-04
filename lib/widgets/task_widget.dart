import 'package:flutter/material.dart';
import 'package:todo_app/objectbox.g.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/models/task_model.dart';


// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  TaskWidget(this.task, {Key? key}) : super(key: key);
  TaskModel task;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  Box<TaskModel>taskBox = objectBox.store.box<TaskModel>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.symmetric(vertical:  16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 35, 35, 35),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            side: const BorderSide(
                color: Colors.white,
              ),
            
            value: widget.task.taskDone, 
            onChanged: (value){
              widget.task.taskDone = value;
              taskBox.put(widget.task);
            },
            ),
            Expanded(
              child: Text(
                widget.task.taskTitle!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                )
              ),
            ),
            IconButton(
              onPressed: (){
                taskBox.remove(widget.task.id);
              },
              icon: const Icon(
                Icons.delete, 
                color: Colors.red,),

            )
        ],
      )
    );
    
  }
}