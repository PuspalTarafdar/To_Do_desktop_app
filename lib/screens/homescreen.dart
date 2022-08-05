
import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/screens/taskeditor.dart';
import 'package:todo_app/objectbox.g.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

@override
State<HomeScreen> createState()=> _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>{

Box<TaskModel>? taskBox;

Stream<List<TaskModel>>? fetchAllTask;
@override
  void initState() {
    super.initState();
    taskBox = objectBox.store.box<TaskModel>();
   setState(() {
      fetchAllTask = taskBox
    ?.query()
    .watch(triggerImmediately:true)
    .map((event)=> event.find());
   });
  }

  @override
  void dispose() {

    objectBox.store.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome 👋🏼",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Today's Tasks",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=> const TaskEditorScreen()));
                        }, 
                        icon: const Icon(Icons.add), 
                        label: const Text("Add New Task"),
                        ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
            
                  StreamBuilder<List<TaskModel>>(
                    stream: fetchAllTask!,
                    builder: (context,  snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                    }else {
                      if(snapshot.hasData){
                        return SingleChildScrollView(
                          child:  Column(
                            children: snapshot.data!
                            .map((e) => TaskWidget(e))
                            .toList()),
                        );
                        
                      }
            
                    }
                      throw '';
                    }
                    
                    
                    )
            
                ],
              ),
            ),
          ),
        ));
  }
}
