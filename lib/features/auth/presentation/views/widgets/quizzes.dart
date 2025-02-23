import 'package:flutter/material.dart';

class Quizzes extends StatelessWidget {
  const Quizzes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quizzes")),
      body: const Center(
        child: Text(
          "Welcome to Quizzes!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
