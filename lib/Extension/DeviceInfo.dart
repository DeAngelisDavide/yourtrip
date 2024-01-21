import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

enum DeviceType { mobile, tablet, web, mac, windows, linux, fuchsia }

extension PercentageDouble on double {
  //percentage horizontal
  double  ph (context) {
    return( this * MediaQuery.of(context).size.width)/100;
  }
  //percentage vertical
  double pv (context) {
    return( this * MediaQuery.of(context).size.height)/100;
  }

  //font percentage
  double pf(context){
    return (this * (MediaQuery.of(context).size.width/3))/100;
  }
}

extension PercentageInt on int {
  //percentage horizontal
  double  ph (context) {
    return( this * MediaQuery.of(context).size.width)/100;
  }
  //percentage vertical
  double pv (context) {
    return( this * MediaQuery.of(context).size.height)/100;
  }

  //font percentage
  double pf(context){
    return (this * (MediaQuery.of(context).size.width/3))/100;
  }
}

extension Equals on DeviceType {
  bool equalsToCurrent(context) {
    var deviceType = DeviceType.fuchsia;
    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else if (Platform.isAndroid || Platform.isIOS) {
      deviceType = (MediaQuery.of(context).size.width < 600
          ? DeviceType.mobile
          : DeviceType.tablet);
    } else if (Platform.isMacOS) {
      deviceType = DeviceType.mac;
    } else if (Platform.isLinux) {
      deviceType = DeviceType.linux;
    } else if (Platform.isFuchsia) {
      deviceType = DeviceType.fuchsia;
    }
    return this == deviceType;
  }

  bool lenghtEquals(context){
     var deviceType = MediaQuery.of(context).size.width < 600  ? DeviceType.mobile:DeviceType.tablet;
     return this == deviceType;
  }
}
