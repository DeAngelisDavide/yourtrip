import 'package:flutter/material.dart';

import 'DeviceInfo.dart';


extension CustomStyles on TextTheme {

  TextStyle  header1( {required context, constraint, color}){
    constraint ??= BoxConstraints(maxWidth: MediaQuery.of(context).size.width, maxHeight: MediaQuery.of(context).size.height);
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize:DeviceType.mobile.lenghtEquals(context)?(constraint.maxWidth*25)/100*0.2:(constraint.maxWidth*27)/100*0.1,
        color: color,
      fontFamily: "Roboto"

    );
  }

  TextStyle  header2({required context, constraint, color}){
    constraint ??= BoxConstraints(maxWidth: MediaQuery.of(context).size.width, maxHeight: MediaQuery.of(context).size.height);
    return TextStyle(
        fontSize:DeviceType.mobile.lenghtEquals(context)?(constraint.maxWidth*25)/100*0.2:(constraint.maxWidth*27)/100*0.1,
        color: color,
        fontFamily: "Roboto"
    );
  }

  TextStyle  header3( {required context, constraint, color}){
    constraint ??= BoxConstraints(maxWidth: MediaQuery.of(context).size.width, maxHeight: MediaQuery.of(context).size.height);
    return TextStyle(
        fontSize:DeviceType.mobile.lenghtEquals(context)?(constraint.maxWidth*14)/100*0.2:(constraint.maxWidth*16)/100*0.1,
        color: color
    );
  }
}
