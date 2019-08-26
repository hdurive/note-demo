

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserFirebase{
  FirebaseUser _firebaseUser;

  UserFirebase(this._firebaseUser);

  String get email => _firebaseUser.email;
  String  get name  => _firebaseUser.displayName ;
  String  get id  => _firebaseUser.uid ;
  String  get photoUrl  => _firebaseUser.photoUrl ;

  toArrayDocument(){
    final map = {
      'id':this.id,
      'email': this.email,
      'name' : this.name,
      'photoUrl': this.photoUrl
    };
    return map;
  }

}