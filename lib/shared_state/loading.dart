import 'package:flutter/foundation.dart';

enum LoginStatusEnum { IDLE, ERROR_LOGIN, SUCCESS_LOGIN }

class CnLoginStatus extends ChangeNotifier {
  LoginStatusEnum loginStatus;

  CnLoginStatus(this.loginStatus);

  setLoginStatus(LoginStatusEnum loginStatus) {
    this.loginStatus = loginStatus;
    notifyListeners();
  }
}

class CnLoading extends ChangeNotifier {
  bool isLoading;

  CnLoading(this.isLoading);

  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }
}
