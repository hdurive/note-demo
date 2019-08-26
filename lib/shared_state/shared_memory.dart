import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notish/core/models/user_firebase.dart';
import 'package:rxdart/rxdart.dart';

class SharedMemory {
  static SharedMemory instance;
  static FirebaseAuth _auth;
  static ReplaySubject<UserFirebase> streamIsLogged;
  static UserFirebase userFirebase;

  SharedMemory._internal();

  static _init() {
    _auth = FirebaseAuth.instance;
    streamIsLogged = ReplaySubject<UserFirebase>(maxSize: 1);
    _auth.onAuthStateChanged.listen((data) {
      if (data != null) {
        userFirebase = UserFirebase(data);
        streamIsLogged.add(UserFirebase(data));
      } else {
        userFirebase = null;
        streamIsLogged.add(null);
      }
    }, onError: (error) {
      userFirebase = null;
      streamIsLogged.add(null);
    }, onDone: () {}, cancelOnError: false);
  }

  factory SharedMemory() {
    if (instance == null) {
      _init();
      instance = SharedMemory._internal();
      return instance;
    }
    return instance;
  }

  static setUserFirebase(UserFirebase user) {
    user == null ? streamIsLogged.add(null) : streamIsLogged.add(user);
  }


}
