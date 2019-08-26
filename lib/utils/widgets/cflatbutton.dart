import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CFlatButton extends StatelessWidget {


  final String _text;
  final VoidCallback _callback;

  CFlatButton( this._text, this._callback);

  @override
  Widget build(BuildContext context) {
    return
        FlatButton(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              _text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            width: 200,
            height: 45,
          ),
          onPressed: _callback,
        );
  }
}
