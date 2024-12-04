import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/login_signup.dart';
import 'package:flutter_apps/student/stu_agency_info.dart';
import 'package:flutter_apps/student/stu_ielts.dart';
import 'package:flutter_apps/student/stu_scholarship.dart';
import 'package:flutter_apps/student/stu_visa_guide.dart';

import 'labour/community_support.dart';
import 'labour/finance_info.dart';
import 'labour/legal_visa_support.dart';
import 'labour/relevent_course.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBMqPDeUw2Yfqb91cGpSa1gX-VpDrk97gw",
      authDomain: "probashcare.firebaseapp.com",
      projectId: "probashcare",
      storageBucket: "probashcare.firebasestorage.app",
      messagingSenderId: "804585355498",
      appId: "1:804585355498:web:c13eee7a2db5815b83ff93",
      measurementId: "G-LQNW3S4608",
    ),
  );
  runApp(const ProbashCareApp());
}

class ProbashCareApp extends StatelessWidget {
  const ProbashCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Probash Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const HomeActivity(),
      },
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🌏 Probash Care"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false, // Remove all previous routes
              );
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.public,
                  size: 50,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome to Probash Care",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your one-stop solution for expatriate welfare.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 20),
              const Text(
                "Choose Your Category",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentSection()),
                  );
                },
                label: const Text(
                  "🎓 Students",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 25),
                  backgroundColor: Colors.blue[600],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LaborerSection()),
                  );
                },
                label: const Text(
                  "💼 Laborers",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 25),
                  backgroundColor: Colors.green[600],
                ),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FeedbackSection()),
                  );
                },
                child: const Text(
                  "📝 Provide Feedback",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Student Section Implementation
class StudentSection extends StatefulWidget {
  const StudentSection({super.key});

  @override
  State<StudentSection> createState() => _StudentSectionState();
}

class _StudentSectionState extends State<StudentSection> {
  String? selectedCountry;
  String? selectedDegree;
  bool showAgencyInfo = false;
  bool showAdditionalInfo = false;

  void showRelatedInfo() {
    setState(() {
      showAgencyInfo = true;
      showAdditionalInfo = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🎓 Student Section"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 10),
          ListTile(
            title: const Text("Country Selection"),
            subtitle: Text(selectedCountry ?? "Select a country"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => _showOptionsDialog(context, "Select Country", [
              "USA",
              "Canada",
              "UK",
              "Australia",
              "Germany"
            ], (value) {
              setState(() {
                selectedCountry = value;
              });
            }),
          ),
          if (selectedCountry != null) ...[
            ListTile(
              title: const Text("Degree Applications"),
              subtitle: Text(selectedDegree ?? "Select a degree"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => _showOptionsDialog(context, "Select Degree", [
                "Bachelor's in Computer Science",
                "Master's in Data Science",
                "PhD in Artificial Intelligence"
              ], (value) {
                setState(() {
                  selectedDegree = value;
                });
              }),
            ),
          ],
          if (selectedDegree != null) ...[
            ElevatedButton(
              onPressed: showRelatedInfo,
              child: const Text("Search for Relevant Information"),
            ),
            if (showAgencyInfo) ...[
              ListTile(
                title: const Text("Agency Information"),
                subtitle: const Text("Global Education Agency"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AgencyInfoPage()),
                  );
                },
              ),
            ],
            if (showAdditionalInfo) ...[
              ListTile(
                title: const Text("IELTS Resources"),
                subtitle: const Text("Preparation Materials"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const IeltsResourcesPage()),
                  );
                },
              ),
              ListTile(
                title: const Text("Visa Guidance"),
                subtitle: const Text("Visa Application Assistance"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VisaGuidancePage()),
                  );
                },
              ),
              ListTile(
                title: const Text("Scholarship Opportunities"),
                subtitle: const Text("Available Scholarships"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScholarshipOpportunitiesPage()),
                  );
                },
              ),
            ],
          ],
        ],
      ),
    );
  }

  // Function to show dialog with options
  void _showOptionsDialog(BuildContext context, String title, List<String> options, Function(String) onSelect) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options
              .map(
                (option) => ListTile(
              title: Text(option),
              onTap: () {
                Navigator.pop(context); // Close dialog after selection
                onSelect(option);
              },
            ),
          )
              .toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}

// Laborer Section Implementation
class LaborerSection extends StatefulWidget {
  const LaborerSection({super.key});

  @override
  State<LaborerSection> createState() => _LaborerSectionState();
}

class _LaborerSectionState extends State<LaborerSection> {
  String? selectedCountry;
  String? selectedJob;
  bool showJobInfo = false;
  bool showAdditionalJobInfo = false;

  void showJobRelatedInfo() {
    setState(() {
      showJobInfo = true;
      showAdditionalJobInfo = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("💼 Laborer Section"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 10),
          ListTile(
            title: const Text("Country Selection"),
            subtitle: Text(selectedCountry ?? "Select a country"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => _showOptionsDialog(context, "Select Country", [
              "Saudi Arabia",
              "UAE",
              "Malaysia",
              "Qatar",
              "Singapore"
            ], (value) {
              setState(() {
                selectedCountry = value;
              });
            }),
          ),
          if (selectedCountry != null) ...[
            ListTile(
              title: const Text("Job Type"),
              subtitle: Text(selectedJob ?? "Select a job type"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => _showOptionsDialog(context, "Select Job", [
                "Construction Worker",
                "Cleaning Staff",
                "Hospitality Worker"
              ], (value) {
                setState(() {
                  selectedJob = value;
                });
              }),
            ),
          ],
          if (selectedJob != null) ...[
            ElevatedButton(
              onPressed: showJobRelatedInfo,
              child: const Text("Search for Job Opportunities"),
            ),
            if (showJobInfo) ...[
              ListTile(
                title: const Text("Job Agency Information"),
                subtitle: const Text("Global Worker Agency"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Website: www.workeragency.com")),
                  );
                },
              ),
            ],
            if (showAdditionalJobInfo) ...[
              ListTile(
                title: const Text("Legal and Visa Support"),
                subtitle: const Text("Visa and Labor Law Support"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LegalVisaSupportPage()),
                  );
                },
              ),
              ListTile(
                title: const Text("Financial Information"),
                subtitle: const Text("Financial Support and Loans"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FinancialInformationPage()),
                  );
                },
              ),
              ListTile(
                title: const Text("Community Support"),
                subtitle: const Text("Expats Support Groups"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CommunitySupportPage()),
                  );
                },
              ),
              ListTile(
                title: const Text("Relevant Courses"),
                subtitle: const Text("Courses for Skill Development"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RelevantCoursesPage()),
                  );
                },
              ),
            ],
          ],
        ],
      ),
    );
  }

  // Function to show dialog with options
  void _showOptionsDialog(BuildContext context, String title, List<String> options, Function(String) onSelect) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options
              .map(
                (option) => ListTile(
              title: Text(option),
              onTap: () {
                Navigator.pop(context); // Close dialog after selection
                onSelect(option);
              },
            ),
          )
              .toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}




// Feedback Section Implementation
class FeedbackSection extends StatelessWidget {
  const FeedbackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("📝 Provide Feedback"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "We would love to hear from you! Please provide your feedback below:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Your Feedback",
                hintText: "Enter your feedback here...",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle feedback submission logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Thank you for your feedback!")),
                );
              },
              child: const Text("Submit Feedback"),
            ),
          ],
        ),
      ),
    );
  }
}