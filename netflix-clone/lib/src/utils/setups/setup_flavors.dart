import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SetupFlavors {
  static final SetupFlavors _setupFlavors = SetupFlavors._internal();

  factory SetupFlavors() {
    return _setupFlavors;
  }

  SetupFlavors._internal();

  String baseUrl = "";

  Future<void> setup() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (kIsWeb) {
      baseUrl = "http://localhost:8081/";
    } else {
      if (packageInfo.packageName.contains("homolog")) {
        baseUrl = "";
      } else if (packageInfo.packageName.contains("staging")) {
        baseUrl = "http://10.0.2.2:8081/";
      } else {
        baseUrl = "";
      }
    }
  }
}
