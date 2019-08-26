import 'package:flutter/foundation.dart';
import 'package:notish/core/models/Note.dart';
import 'package:notish/core/models/User.dart';
import 'package:notish/core/services/api_firestore.dart';
import 'package:notish/locator.dart';
import 'package:notish/shared_state/loading.dart';
import 'package:notish/utils/URLS.dart';


class UsersCollection with ChangeNotifier {
  List<User> listUser;

  UsersCollection() {
    this.listUser = List();
  }

  setUsers(List<User> listUser) {
    this.listUser = listUser;
    notifyListeners();
  }

}

class UserPresenter {
  final apiFirestore = locator<ApiFirestore>();
  final cnLoading = CnLoading(false);
  final UsersCollection usersCollection = UsersCollection();

  void listUsers() {
    cnLoading.setIsLoading(true);
    apiFirestore
        .getDataCollection(URLS_FIRESTORE.FIREBASE_USERS_COLLECTION + "/")
        .snapshots()
        .listen((data) {
      if (data != null) {
        var list = data.documents.map((data) => User.fromMap(data.data));
        list = list.toList();
        usersCollection.setUsers(list);
      }
    }, onError: (error) {
      print(error);
    });
  }

  searchUsers(String text){
    if (!text.isEmpty){
      Iterable<User> filterUser = usersCollection.listUser.where((user){
        return user.email.contains(text) || user.name.contains(text);
      });
      usersCollection.setUsers(filterUser.toList());
    }else{
      listUsers();
    }
  }
}
