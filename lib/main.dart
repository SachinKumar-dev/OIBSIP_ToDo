import 'package:flutter/material.dart';
import 'package:notes/Authentication/Login.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myColor = const Color(0xFFEB7A53);
    MaterialColor mySwatch = MaterialColor(myColor.value, <int, Color>{
      50: myColor.withOpacity(0.1),
      100: myColor.withOpacity(0.2),
      200: myColor.withOpacity(0.3),
      300: myColor.withOpacity(0.4),
      400: myColor.withOpacity(0.5),
      500: myColor.withOpacity(0.6),
      600: myColor.withOpacity(0.7),
      700: myColor.withOpacity(0.8),
      800: myColor.withOpacity(0.9),
      900: myColor.withOpacity(1),
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: mySwatch,
      ),
      home: const Login(),
    );
  }
}
