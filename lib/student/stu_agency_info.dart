import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class AgencyInfoPage extends StatefulWidget {
  const AgencyInfoPage({super.key});

  @override
  State<AgencyInfoPage> createState() => _AgencyInfoPageState();
}

class _AgencyInfoPageState extends State<AgencyInfoPage> {
  List<dynamic> agencies = [];

  @override
  void initState() {
    super.initState();
    loadAgencyData();
  }

  Future<void> loadAgencyData() async {
    try {
      final String response = await rootBundle.loadString('assets/stu_agency_info.json');
      final List<dynamic> data = json.decode(response);
      setState(() {
        agencies = data;
      });
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agency Information"),
      ),
      body: agencies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: agencies.length,
        itemBuilder: (context, index) {
          final agency = agencies[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(agency['name']),
              subtitle: Text(agency['description']),
              trailing: IconButton(
                icon: const Icon(Icons.link),
                onPressed: () {
                  // Open the agency's website
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(agency['name']),
                      content: Text("Visit: ${agency['website']}"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Close"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}