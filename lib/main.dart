import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ugaoo/Controller/PreferenceController.dart';
import 'package:ugaoo/Controller/authController.dart';
import 'package:ugaoo/misc/Routes.dart';
import 'package:ugaoo/misc/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MyPref _pref = MyPref();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: ksecondaryBackgroundColor,
      ),
      initialRoute: _pref.firstPage,
      getPages: Routes.routes,
    );
  }
}
