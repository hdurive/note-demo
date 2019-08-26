import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final TextEditingController myController;
  final bool obscuredText;
  bool error = true;
  IconData icon;
  String name;
  Color color;

  CTextField({this.myController,this.obscuredText=false, this.error, this.icon,this.name,this.color=Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextField(
        controller: myController,
        obscureText: this.obscuredText,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:  this.color, width: 0.5, ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            labelStyle: TextStyle(color: this.color),
            labelText : name==null ? null : name ,
            contentPadding: EdgeInsets.all(0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: error ? Colors.red : this.color, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: error ? Colors.red : this.color, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            prefixIcon: Icon(icon,color: this.color,)),
        maxLines: 1,
        style: new TextStyle(
            fontSize: 14.0,
            // height: 2.0,
            color: this.color),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
    );
  }
}
