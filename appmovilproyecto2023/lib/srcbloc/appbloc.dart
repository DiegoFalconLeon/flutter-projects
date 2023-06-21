
import 'package:appmovilproyecto2023/srcbloc/screensBloc/login_screens.dart';
import 'package:flutter/material.dart';

class Appbloc extends StatelessWidget {
  static const String routeName = "/bloc";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}