
import 'package:notish/shared_state/shared_memory.dart';
import 'package:shared_preferences/shared_preferences.dart';

class URLS_FIRESTORE{
  static const FIREBASE_USERS_COLLECTION = "users_collection";
  static const FIREBASE_NOTES_COLLECTION = "notes_collection";
  static const FIREBASE_TASK_COLLECTION = "task_collection";
}
class Common {

  static const HEADERS_LOGIN = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };
  static var HEADERS = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };
}



