import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ugaoo/Controller/Auth/authController.dart';
import 'package:ugaoo/Controller/Shared%20Pref/PreferenceController.dart';
import 'package:ugaoo/misc/Routes.dart';
import 'package:ugaoo/misc/colors.dart';

void main() async {
  // Checks if app is installed for the first time.
  await GetStorage.init().then((value) {
    Get.put<MyPref>(MyPref());
  });

  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  WidgetsFlutterBinding
      .ensureInitialized(); //ensures all the bindings before the app runs

  // Load Fireabse Auth Controller.
  // checks if user is already logged in or not. If not, then login screen will appear, else main screen appear.

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: ksecondaryBackgroundColor,
      ),
      initialRoute: '/Splash',
      getPages: Routes.routes,
    );
  }
}
