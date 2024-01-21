import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActualCurrency with ChangeNotifier{
  String _actualCurrency = "\$";
  bool _isInitialized = false;

  ActualCurrency(){
    SharedPreferences.getInstance().then((value) {

      if(value.containsKey("currency")) {
        _actualCurrency = value.getString("currency")!;
        _isInitialized = true;
        notifyListeners();
      }
    });
  }

  String get actualCurrency => _actualCurrency;
  bool get isInitialized => _isInitialized;

  setActualCurrency(String value) {
    _actualCurrency = value;

    SharedPreferences.getInstance().then((value) {
      value.setString("currency", _actualCurrency);
      _isInitialized = true;
    });
    notifyListeners();
  }

  //We need this when we don t have any language selected and we retrive the currency
  //from the locale of the system, in this way we avoid to storange a value that we can calculete
  setActualCurrencyNoSave(String value){
    _actualCurrency = value;
  }

}