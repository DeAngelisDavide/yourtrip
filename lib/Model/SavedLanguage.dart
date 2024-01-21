import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SavedLanguage with ChangeNotifier{
   var _countryCode = "US";
   //if null it will take the language of the system
   var _languageCode = "en";
   var _flagUri = "flags/us.png";
   //We need this to see if we have to load the language of the system or not
   var _isInitialize = false;

  SavedLanguage(){
    SharedPreferences.getInstance().then((value) {
      if(value.containsKey("languageCode")) {
        _isInitialize = true;
        _languageCode = value.getString("languageCode")!;
        _countryCode = value.getString("countryCode")!;
        _flagUri = value.getString("flagUri")!;
        notifyListeners();
      }
    });
  }

   get isInitialize => _isInitialize;
   get languageCode => _languageCode;
   get countryCode => _countryCode;
   get flagUri => _flagUri;

   //Use when we chose a new language in settins
   void setLanguage(CountryCode newValue) {
     _isInitialize = true;
     _countryCode = newValue.code!;
     _flagUri = newValue.flagUri!;

     switch(_countryCode){
       case 'SA':
         _languageCode="ar";
         break;
       case 'DE':
         _languageCode="de";
         break;
       case 'GB':
         _languageCode="en";
         break;
       case 'US':
         _languageCode="en";
         break;
       case 'FR':
         _languageCode="fr";
         break;
       case 'IT':
         _languageCode="it";
         break;
       case 'PT':
         _languageCode="pt";
         break;
       case 'CN':
         _languageCode="zh";
         break;
     }

     SharedPreferences.getInstance().then((value) {
       value.setString("countryCode",_countryCode);
       value.setString("flagUri",_flagUri);
       value.setString("languageCode", _languageCode);
     });

     notifyListeners();
  }

  //Used when we use the system language
  String setCountry(String languageCode){

      switch (languageCode) {
        case 'ar':
          _countryCode = "SA";
          break;
        case 'de':
          _countryCode = "DE";
          break;
        case 'en':
          _countryCode = "US";
          break;
        case 'fr':
          _countryCode = "FR";
          break;
        case 'it':
          _countryCode = "IT";
          break;
        case 'pt':
          _countryCode = "PT";
          break;
        case 'zh':
          _countryCode = "CN";
          break;
      }
      _languageCode = languageCode;
      _flagUri = "flags/${_countryCode.toLowerCase()}.png";

    return _languageCode;
  }

}