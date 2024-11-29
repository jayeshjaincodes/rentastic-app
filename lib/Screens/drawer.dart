import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentastic/Screens/rentastic_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    // Redirect to login screen after logout
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RentasticScreen(),));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo at the top
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('assets/logo.png',  fit: BoxFit.cover),
            ),

            // Logout button at the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: const Size(double.infinity, 50), // Full width button
                ),
                onPressed: logout,
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
