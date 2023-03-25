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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  int parks = 30;

  String img = 'assets/images/park-empty.jpg';
  String msg = '';

  void increment() {
    setState(() {
      if (!isFull) {
        count++;
        parks--;
      }
      setImage(count);
      setMessage();
    });
    //print(count);
  }

  void decrement() {
    setState(() {
      if (!isEmpty) {
        count--;
        parks++;
      }
      setImage(count);
      setMessage();
    });
    //print(count);
  }

  void setImage(int number) {
    if (number > 5) img = 'assets/images/park-some.jpg';
    if (number > 25) img = 'assets/images/park-full.jpg';
    if (number <= 5) img = 'assets/images/park-empty.jpg';
  }

  void setMessage() {
    msg = 'Há $parks vaga(s)!';
    if (isEmpty) msg = 'Vazio! (30 vagas)';
    if (isFull) msg = 'Lotado! (0 vagas)';
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: unnecessary_const
          children: [
            Text(
              msg,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: isFull ? Colors.red : Colors.white,
              ),
            ),
            //const SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w500,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            //const SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 80),
                    //padding: const EdgeInsets.all(32),
                    foregroundColor: isFull ? Colors.red : Colors.black,
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
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
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
      ),
    );
  }
}
