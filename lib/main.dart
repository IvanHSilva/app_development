import 'package:flutter/material.dart';
import 'app04/coin_conversor_app.dart';
//import 'app03/imc_calc_app.dart';
//import 'app01/park_app.dart';
//import 'app02/tasklist_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: ParkApp(),
      //home: TaskListApp(),
      home: const CoinConversor(),
      theme: ThemeData(hintColor: Colors.white, primaryColor: Colors.white),
      //home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
