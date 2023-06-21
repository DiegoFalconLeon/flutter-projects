import 'package:flutter/material.dart';
import 'package:finalproyect/screen/registro_screen.dart';

class CustomRegistro extends StatelessWidget {
  const CustomRegistro({
    Key? key,
    required this.ruta,
  }) : super(key: key);
  final String ruta;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, ruta),
      child: Text(
        ruta == RegistroScreen.routeName
            ? "Registrarse"
            : 'Ir a inicio de Sesión',
        style: const TextStyle(
          color: Colors.green,
          fontSize: 20,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
