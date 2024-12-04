import 'package:flutter/material.dart';

class CommunitySupportPage extends StatelessWidget {
  const CommunitySupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Community Support"),
      ),
      body: const Center(
        child: Text("Expats Support Groups will be listed here."),
      ),
    );
  }
}