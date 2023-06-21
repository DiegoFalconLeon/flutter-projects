import 'package:flutter/material.dart';

class CustomTitulo extends StatelessWidget {
  const CustomTitulo({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 50,
      ),
    );
  }
}
