import 'package:get_it/get_it.dart';
import 'package:notish/modules/home/presenters/home_presenter.dart';

import 'package:notish/modules/note/presenters/user_presenter.dart';
import 'package:notish/modules/principal/presenters/note_list_presenter.dart';

import './core/services/api_firestore.dart';
import 'core/services/api_login.dart';
import 'modules/login/presenters/login_presenter.dart';
import 'modules/note/presenters/note_presenter.dart';

GetIt locator = GetIt();

void setupLocator() {
  //Apis
  locator.registerLazySingleton(() => ApiLogin());
  locator.registerLazySingleton(() => ApiFirestore());
  //Presenters
  locator.registerFactory(() => LoginPresenter());
  locator.registerFactory(() => HomePresenter());
  locator.registerFactory(() => NotePresenter());
  locator.registerFactory(() => NoteListPresenter());
  locator.registerFactory(() => UserPresenter());



}
