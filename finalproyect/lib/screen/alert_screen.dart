import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void mostrarAlertaAndroid() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text(
            'titulo de mi alerta',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                  'Quis reprehenderit aliqua exercitation ullamco eu laborum.'),
              FlutterLogo(
                size: 80,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('aceptar'),
            ),
          ],
        ),
      );
    }

    void mostrarAlertaIOS() {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('titulo de mi alerta'),
          content: Column(
            children: const [
              Text(
                  'Sit eiusmod adipisicing fugiat ex ullamco adipisicing aliqua dolor cillum tempor anim.'),
              FlutterLogo(
                size: 80,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('aceptar'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed:
              (Platform.isAndroid) ? mostrarAlertaAndroid : mostrarAlertaIOS,
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 15,
            ),
            child: Text('click aqui'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
      ),
    );
  }
}
