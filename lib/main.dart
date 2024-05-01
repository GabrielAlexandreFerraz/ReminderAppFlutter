import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reminderapp/firebase_options.dart';
import 'package:reminderapp/screens/home_screen.dart';
import 'package:reminderapp/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Reminder Notification App",
      debugShowCheckedModeBanner: false,
      home: _auth.currentUser != null ? HomeScreen() : LoginScreen(),
    );
  }
}
