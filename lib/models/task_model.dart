
import 'package:objectbox/objectbox.dart';
@Entity()
class TaskModel{


  int id=0;

  String? taskTitle;
  String? taskDescription;
  bool? taskDone;
  DateTime? creationDate;

  TaskModel({this.creationDate, this.taskDescription, this.taskTitle, this.taskDone});
}


