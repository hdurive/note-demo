import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:notish/shared_state/shared_memory.dart';
import 'package:rxdart/rxdart.dart';

class MainPresenter {
  Observable streamIsLogged = SharedMemory.streamIsLogged.stream;
  MainPresenter();
}
