import 'package:flutter/material.dart';

class TaskListApp extends StatelessWidget {
  TaskListApp({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-Mail',
                  hintText: 'email@provedor.com',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              ElevatedButton(
                onPressed: enter,
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void enter() {
    String message = emailController.text;
    print(message);
    emailController.clear();
  }
}
