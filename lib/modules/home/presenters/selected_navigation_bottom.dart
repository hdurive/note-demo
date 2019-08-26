import 'package:flutter/foundation.dart';

class SelectedNavigationBottom extends ChangeNotifier{
  int _index=0;

  SelectedNavigationBottom(this._index);

  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }


}