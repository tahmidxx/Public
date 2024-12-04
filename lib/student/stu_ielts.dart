import 'package:flutter/material.dart';

class IeltsResourcesPage extends StatelessWidget {
  const IeltsResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IELTS Resources"),
      ),
      body: const Center(
        child: Text("IELTS Preparation Materials will be listed here."),
      ),
    );
  }
}