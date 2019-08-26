
import 'package:notish/core/services/api_login.dart';
import 'package:notish/locator.dart';

class BottomBarItem{

}
class HomePresenter {

  var apiLogin = locator<ApiLogin>();

  signOut(){
    apiLogin.signOut();
  }

}
