import 'package:flutter/material.dart';

class IMCCalcApp extends StatefulWidget {
  const IMCCalcApp({super.key});

  @override
  State<IMCCalcApp> createState() => _IMCCalcAppState();
}

class _IMCCalcAppState extends State<IMCCalcApp> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _info = 'Informe seu peso e altura';

  void _resetField() {
    weightController.text = '';
    heightController.text = '';
  }

  void imcCalculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      _info = '';
      if (imc >= 40.0) {
        _info = 'Obesidade Grau 3';
      }
      if (imc >= 34.9) {
        _info = 'Obesidade Grau 2';
      }
      if (imc >= 29.9) {
        _info = 'Obesidade Grau 1';
      }
      if (imc >= 24.9) {
        _info = 'Levemente Acima do Peso';
      }
      if (imc >= 18.6) {
        _info = 'Peso Ideal';
      }
      if (imc < 18.6) {
        _info = 'Abaixo do Peso';
      }
      if (_info.isNotEmpty) {
        _info += ' (${imc.toStringAsPrecision(3)})';
      }
    });
  }

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
            onPressed: _resetField,
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
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.green,
              ),
              decoration: const InputDecoration(
                labelText: 'Peso (Kg)',
                labelStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                ),
              ),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.green,
              ),
              decoration: const InputDecoration(
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
                  onPressed: imcCalculate,
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
            Text(
              _info,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
