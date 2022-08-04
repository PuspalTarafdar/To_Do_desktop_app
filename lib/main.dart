import 'package:flutter/material.dart';
import 'package:todo_app/helper/objectbox_interface.dart';
import 'package:todo_app/screens/homescreen.dart';
import 'screens/homescreen.dart';


late ObjectBox objectBox;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
