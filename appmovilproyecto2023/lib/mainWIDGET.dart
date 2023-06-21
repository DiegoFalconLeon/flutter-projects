import 'package:flutter/material.dart';

void main(){
  var primerapp=MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Mi Primer APP - UNJFSC 2023"),),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Welcome", 
          style: TextStyle(fontSize:40)),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
        //child: Icon(Icons.navigation),
       // backgroundColor: Colors.green,
        //child: Icon(Icons.add),
        onPressed:(){
          print('Le dio un Click al Icon');
        }
      ),
    ),
  );
  runApp(primerapp);
}
