import 'dart:io';

enum PlatformType {
  web,
  android,
  ios,
}

class PlatformUtil {
  static PlatformType getPlatformType() {
    if (isWeb()) {
      return PlatformType.web;
    } else if (isAndroid()) {
      return PlatformType.android;
    } else if (isIOS()) {
      return PlatformType.ios;
    } else {
      return PlatformType.android;
    }
  }

  static bool isWeb() {
    // only JavaScript return true for 0 === 0.0
    return identical(0, 0.0);
  }

  static bool isAndroid() {
    try {
      return Platform.isAndroid;
    } catch (e) {
      return false;
    }
  }

  static bool isIOS() {
    try {
      return Platform.isIOS;
    } catch (e) {
      return false;
    }
  }
}