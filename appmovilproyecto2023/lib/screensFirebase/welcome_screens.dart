import 'package:appmovilproyecto2023/widgets/app_button.dart';
import 'package:appmovilproyecto2023/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class WelcomeScreens extends StatefulWidget {
  static const String routeName = "/welcome";

  @override
  State<WelcomeScreens> createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppIcon(),
            SizedBox(
              height: 48.0,
            ),
            AppButton(color: Colors.lightBlueAccent, name: "Log In", onPressed: () {
              Navigator.pushNamed(context, '/loginFirebase');
            }, ),
            AppButton(color: Colors.blueAccent,name: "Register", onPressed: () {
              Navigator.pushNamed(context, '/register');
            },),
          ],
        ),
      ),
    );
  }
}