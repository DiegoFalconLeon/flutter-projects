import 'package:appmovilproyecto2023/screensform/screens/login_screens.dart';
import 'package:flutter/material.dart';

class Validation extends StatelessWidget {
  static const String routeName = "/validation";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Validacion de Formulario"),
        ),
        body: Login()
      ),
    );
  }
}