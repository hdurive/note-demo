import 'package:firebase_messaging/firebase_messaging.dart';

class CloudMessageListener{
  static CloudMessageListener instance;
  static FirebaseMessaging _firebaseMessaging;
  CloudMessageListener._internal();

  static _init(){
    _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure(onMessage: (message) {
      print("message");
      _handleNotification(message);
    }, onLaunch: (launch) {
      print("launch");
      _handleNotification(launch);
    }, onResume: (resume) {
      print("resume");
      _handleNotification(resume);
    });
  }

  factory CloudMessageListener() {
    if (instance == null) {
      _init();
      instance = CloudMessageListener._internal();
      return instance;
    }
    return instance;
  }



  static Future<void> _handleNotification(Map<dynamic, dynamic> message,
      [bool dialog]) async {
    var data = message['data'] ?? message;
    print(data['hola']);
    print(data);
  }



}