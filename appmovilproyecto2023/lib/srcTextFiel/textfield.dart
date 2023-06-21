import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  @override
  _MyTextField createState() => new _MyTextField();
}

class _MyTextField extends State<MyTextField> {
  String inpuText = "";
  final TextEditingController controller =
      TextEditingController(); //Instanciando
  void onSubmitted(String value) {
    setState(() {
      inpuText = inpuText + "\n" + value;
      controller.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Widget TextField"),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Ingrese el nombre"),
              onSubmitted: onSubmitted,
              controller: controller,
              //(String value) {  print(value);},
            ),
            Text(inpuText),
          ],
        ),
      ),
    );
  }
}