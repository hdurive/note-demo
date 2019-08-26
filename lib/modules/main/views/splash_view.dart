import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notish/modules/home/views/home_view.dart';
import 'package:notish/modules/login/views/login_view.dart';
import 'package:notish/shared_state/shared_memory.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  StreamSubscription streamSubscription;

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: GestureDetector(
          onTap: () {
            LoginView.openView(context);
          },
          child: Image.asset(
            'assets/images/background_up.png',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }

  _startTime() async {
    var _duration = new Duration(seconds: 1);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    print("navigationPage");
    streamSubscription = SharedMemory.streamIsLogged.stream.listen((value) {
      print("navigationPage");
      if (value != null) {
        HomeView.openView(context);
      } else {
        LoginView.openView(context);
      }
    });
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }
}
