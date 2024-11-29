import 'package:flutter/material.dart';
import 'package:rentastic/Screens/drawer.dart';
import 'package:rentastic/Screens/login_screen.dart';

class RentasticScreen extends StatefulWidget {
  const RentasticScreen({super.key});

  @override
  State<RentasticScreen> createState() => _RentasticScreenState();
}

class _RentasticScreenState extends State<RentasticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.yellow.shade700,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          
          Center(
            child: Image.asset('assets/logo.png'),
          ),

         
          Positioned(
            bottom: 60, 
            left: 0, 
            right: MediaQuery.of(context).size.width / 2,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 199, 170, 96),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(vertical: 15), 
              ),
              child: const Text(
                'LOG IN',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
