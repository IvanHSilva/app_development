import 'package:flutter/material.dart';
import 'app01/park_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ParkApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
