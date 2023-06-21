import "package:flutter/material.dart";

class MyCardFlutter extends StatelessWidget {
  final Widget? title;
  final Widget? icon;
  MyCardFlutter({this.title, this.icon});
  @override
  Widget build(BuildContext context){
    return Card(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget> [this.title!,this.icon!],
        )
      )
    );
  }
}