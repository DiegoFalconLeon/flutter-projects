import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final MaterialAccentColor  color;
  final String name;
  final VoidCallback onPressed;

  const AppButton({required this.color, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: SizedBox(
            height: 42.0,
          child: ElevatedButton(
            child: Text(name),
            onPressed: onPressed,
        ),
        ),
      ),
    );
  }
}