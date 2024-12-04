import 'package:flutter/material.dart';


class VisaGuidancePage extends StatelessWidget {
  const VisaGuidancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Visa Guidance"),
      ),
      body: const Center(
        child: Text("Visa Application Assistance will be listed here."),
      ),
    );
  }
}