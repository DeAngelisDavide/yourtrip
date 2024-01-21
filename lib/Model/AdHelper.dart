import 'dart:io';

class AdHelper {

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return "";
    } else if (Platform.isIOS) {
      return "";
    } else {
      return "";
    }
  }
}
