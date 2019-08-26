import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ButtonLogo extends StatelessWidget {

  final String _text;
  final VoidCallback _callback;

  ButtonLogo(this._text, this._callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20,left: 20,right: 20),
      child: RaisedButton(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            _text,
            style: TextStyle(fontSize: 20, color: Color(0xff96286A)),
          ),
          height: 45,
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        onPressed: _callback,
      ),
    );
  }
}
