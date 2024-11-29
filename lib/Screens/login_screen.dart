import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentastic/Screens/clientForm_screen.dart';
import 'package:rentastic/Screens/signup_screen.dart';
import 'package:rentastic/Screens/workOrder_screen.dart';
import 'package:rentastic/Screens/wrapper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); 
  bool _isLoading = false; 

Future<void> Signin() async {
  if (!_formKey.currentState!.validate()) {
    return; 
  }

  setState(() {
    _isLoading = true; 
  });

  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // Get the logged-in user's email
    String? userEmail = userCredential.user?.email;

    // Check if the email matches the admin email
    if (userEmail == 'admin@gmail.com') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WorkorderScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ClientformScreen()),
      );
    }
  } on FirebaseAuthException catch (e) {
    String errorMessage = "An error occurred. Please try again.";

    if (e.code == 'user-not-found') {
      errorMessage = "No user found for this email.";
    } else if (e.code == 'wrong-password') {
      errorMessage = "Incorrect password. Please try again.";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("An unexpected error occurred."),
        backgroundColor: Colors.red,
      ),
    );
  } finally {
    setState(() {
      _isLoading = false; 
    });
  }
}


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      filled: true,
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.yellow[300]),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.yellow[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.yellow[300]!),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.yellow[300]!),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 25),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: passwordController,
                    obscureText: true, // Hide password input
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.yellow[300]),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.yellow[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.yellow[300]!),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.yellow[300]!),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 25),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                _isLoading
                    ? const CircularProgressIndicator(color: Colors.yellow)
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[300],
                          minimumSize: Size(screenWidth * 0.5, screenHeight * 0.05),
                        ),
                        onPressed: Signin,
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                const SizedBox(height: 35),
                GestureDetector(
                  child: Text(
                    'Don\'t Have an Account? Sign up',
                    style: TextStyle(color: Colors.yellow[300], fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
