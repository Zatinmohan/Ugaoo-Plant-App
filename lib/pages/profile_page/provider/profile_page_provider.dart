import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

const String _logName = "Profile Provider";

class ProfilePageProvider extends ChangeNotifier {
  ProfilePageProvider() {
    log("Profile Provider Activated", name: _logName);
  }
  String? appVersion;
  Future<void> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    appVersion = info.version;
    notifyListeners();
  }
}
