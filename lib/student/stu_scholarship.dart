import 'package:flutter/material.dart';


class ScholarshipOpportunitiesPage extends StatelessWidget {
  const ScholarshipOpportunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scholarship Opportunities"),
      ),
      body: const Center(
        child: Text("Scholarships Information will be listed here."),
      ),
    );
  }
}