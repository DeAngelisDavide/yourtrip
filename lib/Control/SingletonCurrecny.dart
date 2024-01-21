import 'package:yourtrip/Model/ActualCurrency.dart';

class SingletonCurrency {
  static final ActualCurrency _instance = ActualCurrency();

  static ActualCurrency getInstance(){
    return _instance;
  }

  SingletonCurrency._internal();
}