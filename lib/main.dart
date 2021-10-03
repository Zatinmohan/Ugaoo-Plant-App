import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ugaoo/misc/Routes.dart';
import 'package:ugaoo/misc/colors.dart';

void main() {
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
      initialRoute: '/',
      getPages: Routes.routes,
    );
  }
}
