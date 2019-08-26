import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CTextFieldSearch extends StatelessWidget {
  final TextEditingController myController;
  final bool obscuredText;
  bool error = true;
  IconData icon;
  String name;

  CTextFieldSearch(
      {this.myController,
      this.obscuredText = false,
      this.error,
      this.icon,
      this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: TextField(
        controller: myController,
        obscureText: this.obscuredText,
        decoration: InputDecoration(
            fillColor: Colors.grey,
            hintText: name == null ? null : name,
            labelStyle: TextStyle(color: Colors.black),
            contentPadding: EdgeInsets.all(0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),

            prefixIcon: Icon(
              icon,
              color: Colors.black,
            )),
        maxLines: 1,
        style:  TextStyle(
            fontSize: 16.0,
            // height: 2.0,
            color: Colors.grey),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
    );
  }
}
