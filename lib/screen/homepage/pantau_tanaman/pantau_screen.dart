import 'package:flutter/material.dart';

class PantauScreen extends StatelessWidget {
  const PantauScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantau Tanaman")),
      body: const Center(
        child: Text(
          "Halaman Pantau Tanaman",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
