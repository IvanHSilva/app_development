import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void increment() {
    print('+');
  }

  void decrement() {
    print('-');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: unnecessary_const
        children: [
          const Text(
            'Há vagas!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          //const SizedBox(height: 32,),
          const Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              '0',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          //const SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: increment,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: const Size(100, 80),
                  //padding: const EdgeInsets.all(32),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 32,
              ),
              TextButton(
                onPressed: decrement,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: const Size(100, 80),
                  foregroundColor: Colors.black,
                  //primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Sair',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
