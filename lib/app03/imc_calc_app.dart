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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person_outlined,
              size: 120,
              color: Colors.green,
            ),
            const TextField(
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
            const TextField(
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
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'Info',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
