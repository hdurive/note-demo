import 'dart:async';

import 'package:notish/core/models/UserLogged.dart';
import 'package:notish/core/models/user_firebase.dart';
import 'package:notish/core/services/api_login.dart';
import 'package:notish/locator.dart';
import 'package:notish/shared_state/loading.dart';
import 'package:notish/shared_state/shared_memory.dart';

enum LoginType { EMAIL, FACEBOOK, GOOGLE }

class LoginPresenter {
  ApiLogin _api = locator<ApiLogin>();

  var cnLoading = CnLoading(false);
  var cnLoginStatus = CnLoginStatus(LoginStatusEnum.IDLE);

  loginSocial(LoginType loginType, [String username, String password]) {
    cnLoading.setIsLoading(true);
    Future<UserFirebase> login;
    switch (loginType) {
      case LoginType.EMAIL:
        login = _api.handleSignInEmail(username, password);
        break;
      case LoginType.FACEBOOK:
        login = _api.handleSignInFacebook();
        break;
      case LoginType.GOOGLE:
        login = _api.handleSignInGoogle();
        break;
    }
    login.then((user) {
      cnLoading.setIsLoading(false);
      cnLoginStatus.setLoginStatus(LoginStatusEnum.SUCCESS_LOGIN);
      SharedMemory.setUserFirebase(user);


    }).catchError((error) {
      cnLoading.setIsLoading(false);
      cnLoginStatus.setLoginStatus(LoginStatusEnum.ERROR_LOGIN);
      SharedMemory.setUserFirebase(null);

      print(error);
    }).whenComplete(() {});
  }

  void signOut() {
    _api.signOut();
  }


}
