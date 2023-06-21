import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}
enum DialogAction{
    yes,
    no
}

class _MyDialogState extends State<MyDialog> {
  String inpuText = "";
  final TextEditingController controller =
      TextEditingController(); //Instanciando
  void onSubmitted(String value) {
    setState(() {
      inpuText = inpuText + "\n" + value;
      controller.text = "";
    });
  }
  void AlertResult(DialogAction action){
    print("Tu eleccion es  $action");
  }
  void showAlert(){
    AlertDialog dialog = AlertDialog(
      content: Text("Alerta"),
      actions: <Widget>[
        ElevatedButton(
          onPressed: (){
            
            AlertResult(DialogAction.yes);
          },
          child: Text('Yes'),
        ),
         ElevatedButton(
          onPressed: (){
            AlertResult(DialogAction.no);
          },
          child: Text('No'),
        ),
      ],
    
    );
    showDialog(context: context, builder: (BuildContext context){
      
      return dialog;
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Alert Dialog"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Ingrese un texto"),
            ),
            ElevatedButton(
              onPressed: showAlert,
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(90,15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24.0)
                    ),
                  )
                ), 
                child: Text("Alerta"),
            ),
/*
            IconButton(
              iconSize:72,
              icon: const Icon(Icons.alarm_on_rounded),
              color: Colors.redAccent,
              onPressed: showAlert,
              ),*/
          ],
        ),
      )
    );
  }
}