import 'package:flutter/material.dart';

class Models {
  final IconData icon;
  final String titulo;
  final Widget screen;
  final String ruta;

  Models({
    required this.icon,
    required this.titulo,
    required this.screen,
    required this.ruta,
  });
}

class VideoModel{
  String nombre;
  String genero;

  VideoModel({required this.nombre, required this.genero});
}
