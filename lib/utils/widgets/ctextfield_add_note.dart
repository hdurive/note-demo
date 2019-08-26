import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CTextFieldAddnote extends StatefulWidget {
  final TextEditingController myController;

  bool error = true;
  String hint;
  IconData icon;
  final int numberLines;


  CTextFieldAddnote(
      {this.icon,
      this.myController,
      this.error,
      this.hint,
      this.numberLines = 1});


  @override
  _CTextFieldAddnoteState createState() => _CTextFieldAddnoteState(
      error: error,
      icon: icon,
      myController: myController,
      hint: hint,
      numberLines: numberLines);
}

class _CTextFieldAddnoteState extends State<CTextFieldAddnote> {
  final TextEditingController myController;

  bool error = true;
  String hint;
  IconData icon;
  final int numberLines;

  _CTextFieldAddnoteState(
      {this.icon,
      this.myController,
      this.error,
      this.hint,
      this.numberLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue[900],
      style: TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          suffixIcon:
              this.icon != null ? Icon(this.icon, color: Colors.green) : null),
      controller: myController,
      maxLines: this.numberLines,
    );
  }
}
