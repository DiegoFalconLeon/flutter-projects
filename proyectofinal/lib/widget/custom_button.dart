import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.texto,
    this.onPressed,
  }) : super(key: key);

  final String texto;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      onPressed: onPressed,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Text(
          texto,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      )),
    );
  }
}
