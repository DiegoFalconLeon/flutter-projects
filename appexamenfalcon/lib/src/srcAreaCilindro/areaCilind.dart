import 'package:flutter/material.dart';

class MyAppAreaCilindro extends StatefulWidget {
  @override
  _MyAppAreaCilindro createState() => _MyAppAreaCilindro();
}

class _MyAppAreaCilindro extends State<MyAppAreaCilindro> {
  final TextEditingController radio = TextEditingController();
  final TextEditingController altura = TextEditingController();
  double result = 0;

  double calculate(double r, double h) {
    setState(() {
      result = 2 * 3.1416 * r * (r + h);
    });
    return result;
  }

  void Resultado() {
    result =
        calculate(double.parse(radio.text), double.parse(altura.text));
    AlertDialog dialog = AlertDialog(
        content: Text("El área del cilindro con los datos brindados es" + result.toString()),
        actions: <Widget>[
          //CONFIRMACION AL USER
        ]);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pregunta 01: Calcular área de Cilindro "),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
                controller: radio,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingrese el radio del cilindro',
                ),
              ),
            TextField(
              controller: altura,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ingrese la altura del cilindro',
              ),
            ),
          IconButton(
            iconSize: 72,
            icon: const Icon(Icons.confirmation_number_sharp),
            color: Colors.blueAccent,
            onPressed: Resultado
          )
        ]),
      ),
    );
  }
}
