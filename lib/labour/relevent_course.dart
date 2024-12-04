import 'package:flutter/material.dart';

class RelevantCoursesPage extends StatelessWidget {
  const RelevantCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Relevant Courses"),
      ),
      body: const Center(
        child: Text("Courses for Skill Development will be listed here."),
      ),
    );
  }
}