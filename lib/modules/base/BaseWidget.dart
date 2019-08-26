import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notish/modules/login/views/login_view.dart';
import 'package:notish/shared_state/shared_memory.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

}

abstract class BaseState<Page extends BasePage> extends State<Page> {
  StreamSubscription streamSubscription;
  _listenStream() {
    streamSubscription = SharedMemory.streamIsLogged.stream.listen((value) {
      if (value == null) {
        LoginView.openView(context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _listenStream();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }
}

mixin BasicPage<Page extends BasePage> on BaseState<Page> {
  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body();
}

