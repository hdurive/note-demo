
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notish/modules/main/views/splash_view.dart';
import 'package:notish/shared_state/listeners.dart';
import 'package:notish/shared_state/shared_memory.dart';

import 'generated/i18n.dart';
import 'locator.dart';


void main(){
  SharedMemory();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    CloudMessageListener();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.blue
    ));
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      home: SplashView(),
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Color(0xff96286A),
        accentColor: Color(0xff96286A),
      ),
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback:
      S.delegate.resolution(fallback: new Locale("en", "")),
    );
  }
}

