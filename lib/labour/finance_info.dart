import 'package:flutter/material.dart';



class FinancialInformationPage extends StatelessWidget {
  const FinancialInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Financial Information"),
      ),
      body: const Center(
        child: Text("Financial Support and Loans will be listed here."),
      ),
    );
  }
}