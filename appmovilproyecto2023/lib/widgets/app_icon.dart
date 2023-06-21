import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset("images/login.png"),
        Text("Login Firebase",
            style: TextStyle(
                fontSize: 45.0,
                //fontWeight: FontWeight.bold,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent)),
        Text("")
      ],
    );
  }
}
