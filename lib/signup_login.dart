import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login/Signup',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginSignupPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.language, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              "🌏 Probash Care",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({super.key});

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();
  final _signupNameController = TextEditingController();
  final _signupEmailController = TextEditingController();
  final _signupPasswordController = TextEditingController();
  final _signupConfirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _handleLogin() {
    setState(() {
      _isLoading = true;
    });
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      if (_loginEmailController.text == 'admin' &&
          _loginPasswordController.text == 'admin') {
        _showDialog('Success', 'Login successful!');
      } else {
        _showDialog('Error', 'Invalid username or password.');
      }
    });
  }

  void _handleSignup() {
    if (_signupPasswordController.text != _signupConfirmPasswordController.text) {
      _showDialog('Error', 'Passwords do not match.');
      return;
    }
    setState(() {
      _isLoading = true;
    });
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      _showDialog('Success', 'Signup successful!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "🌏 Probash Care",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[200],
        bottom: TabBar(
          controller: _tabController,
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(text: 'Login'),
            Tab(text: 'Signup'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
        color: Colors.indigo[100],
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildLoginForm(),
            _buildSignupForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _loginEmailController,
            decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _loginPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _handleLogin,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _signupNameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _signupEmailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _signupPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _signupConfirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _handleSignup,
            child: const Text('Signup'),
          ),
        ],
      ),
    );
  }
}
