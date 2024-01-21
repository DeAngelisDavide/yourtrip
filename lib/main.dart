
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:yourtrip/Control/SingletonCurrecny.dart';
import 'package:yourtrip/Model/SavedLanguage.dart';
import 'package:yourtrip/routes.dart';
import 'package:intl/intl.dart';
import 'Control/SingletonLanguage.dart';
import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  //SystemChrome.setPreferredOrientations(
     // [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ChangeNotifierProvider.value(
        value: SingletonLanguage.getInstance(),
    child: const MyAppProvider()
    );
  }
}

class MyAppProvider extends StatelessWidget{
  const MyAppProvider();
  static const _colorScheme = ColorScheme(brightness: Brightness.light, primary: Colors.white, onPrimary: Color.fromRGBO(106, 76, 76, 100), secondary: Color.fromRGBO(66, 66, 66, 100), onSecondary:Colors.white, error: Color.fromRGBO(26, 26, 26, 100), onError: Color.fromRGBO(26, 26, 26, 100), background: Color.fromRGBO(26, 26, 26, 100), onBackground: Color.fromRGBO(26, 26, 26, 100), surface: Color.fromRGBO(26, 26, 26, 100), onSurface: Color.fromRGBO(26, 26, 26, 100));
  Widget build(BuildContext context) {
    final _provider = Provider.of<SavedLanguage>(context);
   //Locale of the system
    final locale = Platform.localeName.split('_')[0];
    //Go to see if we have to retrive the currency of the langauge of the system or not
    final currency = SingletonCurrency.getInstance();
    if(!currency.isInitialized){
      currency.setActualCurrencyNoSave(NumberFormat.simpleCurrency(locale: Platform.localeName).currencySymbol);
    }

    return MaterialApp(
      //Initialize the system language if no language was choosen beafore
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale:  Locale(!_provider.isInitialize?_provider.setCountry(locale):_provider.languageCode),
          title: 'Story Maker',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: _colorScheme,
            scaffoldBackgroundColor: Color.fromRGBO(26, 26, 26, 1)
          ),
          initialRoute: RouteGenerator.homePage,
          onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


