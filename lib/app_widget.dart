import 'package:flutter/material.dart';

//import 'home_page.dart';
import 'login.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
    ),
  );
  }
}