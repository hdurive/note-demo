import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CTextFieldAddTask extends StatelessWidget {
  final TextEditingController myController;
  final bool error;

  String name;
  Color color;

  CTextFieldAddTask(
      {this.myController, this.error = false, this.name, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextField(
        controller: myController,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: this.color,
                width: 0.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            labelStyle: TextStyle(color: this.color,fontSize: 12),
            labelText: name == null ? null : name,
            contentPadding: EdgeInsets.all(7),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: error ? Colors.red : this.color, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: error ? Colors.red : this.color, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            )
        ),
        style: new TextStyle(
            fontSize: 20.0,
            // height: 2.0,
            color: this.color),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
    );
  }
}
