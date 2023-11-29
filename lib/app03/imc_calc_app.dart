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
      backgroundColor: Colors.white,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.person_outlined,
            size: 120,
            color: Colors.green,
          ),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: Colors.green,
            ),
            decoration: InputDecoration(
              labelText: 'Peso (Kg)',
              labelStyle: TextStyle(
                fontSize: 30,
                color: Colors.green,
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: Colors.green,
            ),
            decoration: InputDecoration(
              labelText: 'Altura (cm)',
              labelStyle: TextStyle(
                fontSize: 30,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
