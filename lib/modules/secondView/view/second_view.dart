import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed([]),
    );
  }
}
