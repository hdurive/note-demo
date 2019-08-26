
import 'package:flutter/material.dart';

class PositionedCircle extends StatelessWidget {
  final double right;
  final double top;
  final double height;
  final double width;
  final Color color;
  final Widget child;

  PositionedCircle({this.right, this.top, this.height, this.width, this.child,this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: this.right,
      top: this.top,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(2),
        decoration: new BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(6),
        ),
        constraints: BoxConstraints(
          minWidth: 14,
          minHeight: 14,
        ),
        child: this.child,
      ),
    );
  }
}

class WidgetRoundIcon extends StatelessWidget {
  final String text;

  WidgetRoundIcon(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 8,
      ),
      textAlign: TextAlign.center,
    );
  }
}