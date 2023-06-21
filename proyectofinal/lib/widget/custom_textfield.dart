import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.texto, this.onChanged})
      : super(key: key);
  final String texto;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'el campo no debe estar vacio';
        }
        if (texto == "correo") {
          return (value.contains("@") && value.contains(".com"))
              ? null
              : 'correo invalido';
        } else {
          return (value.length > 5) ? null : 'contraseña debil en la seguridad';
        }
      },
      keyboardType: texto == 'correo' ? TextInputType.emailAddress : null,
      obscureText: texto == 'correo' ? false : true,
      cursorColor: Colors.blueAccent,
      decoration: InputDecoration(
        hintText: 'ingresa tu $texto',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
