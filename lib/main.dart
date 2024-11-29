import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rentastic/Screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for Android and iOS
  try {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyA0GH76enNzJ4rXqCq1qG2CAIdnV2bCrt8',
          appId: '1:635388088732:android:4cdb76b49316a9b9a23859',
          messagingSenderId: '635388088732',
          projectId: 'rentastic-app',
          storageBucket: 'rentastic-app.firebasestorage.app',
        ),
      );
    } else if (Platform.isIOS) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyCqE8klubi3F4ogc5ZX-syv6n7B_IhqpZ4',
          appId: '1:635388088732:ios:16849ae50eae5f88a23859',
          messagingSenderId: '635388088732',
          projectId: 'rentastic-app',
          storageBucket: 'rentastic-app.firebasestorage.app',
          iosBundleId: 'com.example.rentastic',
        ),
      );
    } else {
      throw UnsupportedError("Unsupported platform");
    }
    print("Firebase initialized successfully.");
  } catch (e) {
    print("Firebase initialization failed: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}
