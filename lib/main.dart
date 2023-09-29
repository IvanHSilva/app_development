import 'package:flutter/material.dart';
//import 'app01/park_app.dart';
import 'app02/tasklist_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: ParkApp(),
      home: TaskListApp(),
      //home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
