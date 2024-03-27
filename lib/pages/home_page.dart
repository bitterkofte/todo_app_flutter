import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ToDo Flutter",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
        ),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal[300],
    );
  }
}
