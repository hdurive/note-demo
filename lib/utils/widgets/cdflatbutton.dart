import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notish/generated/i18n.dart';


class CDFlatButton extends StatelessWidget {

  final VoidCallback _callback;

  CDFlatButton( this._callback);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: FlatButton(
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                S.of(context).newUser,
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              Text(
                S.of(context).signUp,
                style: TextStyle(fontSize: 12, color: Theme.of(context).accentColor),
              ),
            ],
          ) ,
        ),
        onPressed: _callback,
      ),
    );
  }
}
