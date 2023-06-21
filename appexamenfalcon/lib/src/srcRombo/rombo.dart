import 'package:flutter/material.dart';

class MyAppAreaRombo extends StatefulWidget {
  @override
  _MyAppAreaRombo createState() => _MyAppAreaRombo();
}

class _MyAppAreaRombo extends State<MyAppAreaRombo> {
  final TextEditingController dmayor = TextEditingController();
  final TextEditingController dmenor = TextEditingController();
  double result = 0;

  double calculate(double dmenor, double dmayor) {
    setState(() {
      result = (dmenor * dmayor) / 2;
    });
    return result;
  }

  void Resultado() {
    result =
        calculate(double.parse(dmenor.text), double.parse(dmayor.text));
    AlertDialog dialog = AlertDialog(
        content: Text("El area del rombo con los datos asignados es " + result.toString() ),
        actions: <Widget>[
          //CONFIRMACION AL USER
        ]);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
       // contarResultado();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pregunta 05: Calcular área de Rombo "),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
                controller: dmenor,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingrese la diagonal menor',
                ),
              ),
            TextField(
              controller: dmayor,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ingrese la diagonal mayor',
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
