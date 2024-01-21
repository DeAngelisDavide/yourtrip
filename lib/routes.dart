import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourtrip/Routes/Create.dart';
import 'package:yourtrip/Routes/Memories.dart';
import 'package:yourtrip/Routes/Settings.dart';
import 'package:yourtrip/Routes/Stats.dart';

import 'Routes/Home.dart';



class RouteGenerator {

  static const String homePage = "/";
  static const String stats = "/stats";
  static const String create = "/create";
  static const String memories = "/memories";
  static const String mySettings = "/settings";

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case homePage:
        return MaterialPageRoute(builder: (_) => const Home(),);
      case stats:
        return MaterialPageRoute(builder: (_) => const Stats(),);
      case create:
        return MaterialPageRoute(builder: (_) => CreateElement(),);
      case memories:
        return MaterialPageRoute(builder: (_) => Memories(),);
      case mySettings:
        return MaterialPageRoute(builder: (_) => Settings(),);

      default: throw FormatException("Page not found");
    }
  }
}

class RouteException implements Exception{
  final String message;
  const RouteException(this.message);
}