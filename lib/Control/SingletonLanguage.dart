

import 'package:yourtrip/Model/SavedLanguage.dart';

class SingletonLanguage {
  static final SavedLanguage _instance = SavedLanguage();

  static SavedLanguage getInstance(){
    return _instance;
  }

  SingletonLanguage._internal();
}