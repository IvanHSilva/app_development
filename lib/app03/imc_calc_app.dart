import 'package:flutter/material.dart';

class IMCCalcApp extends StatelessWidget {
  const IMCCalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontSize: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
