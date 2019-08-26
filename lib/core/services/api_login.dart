import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:notish/core/models/UserLogged.dart';
import 'package:notish/core/models/user_firebase.dart';
import 'package:notish/core/services/api_firestore.dart';
import 'dart:convert';

import 'package:notish/locator.dart';
import 'package:notish/utils/URLS.dart';

class ApiLogin{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final apiFirestore = locator<ApiFirestore>();

  Future<UserFirebase> _authFirebase(AuthCredential credential) async{
    final AuthResult _authUser = await _auth.signInWithCredential(credential);
    final FirebaseUser user = _authUser.user;
    final userFirebase = UserFirebase(user);

    if (_authUser.additionalUserInfo.isNewUser){
      apiFirestore.getDataCollection(URLS_FIRESTORE.FIREBASE_USERS_COLLECTION).document(userFirebase.email).setData(userFirebase.toArrayDocument());
    }

    return userFirebase;
  }

  Future<UserFirebase> handleSignInEmail(
      String username, String password) async {
    var _authUser = await _auth.createUserWithEmailAndPassword(
      email: username,
      password: password,
    );
    final AuthCredential credential = EmailAuthProvider.getCredential(email:username,password: password);
    return _authFirebase(credential);
  }

  Future<UserFirebase>  handleSignInGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return _authFirebase(credential);
  }

  Future<UserFirebase> handleSignInFacebook() async {
    final facebookSignIn = FacebookLogin();
    final result = await facebookSignIn.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
        final profile = UserLogged.fromJson(json.decode(graphResponse.body));

        final AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token);
        return _authFirebase(credential);

        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
    }
  }

  signOut(){
    _auth.signOut();
  }
}