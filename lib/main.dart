import 'package:flutter/material.dart';
import 'package:signup_assignment/sign_up_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SignUpApp();
  }
}


