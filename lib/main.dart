import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/pages/splash_page/views/main_page.dart';
import 'package:ugaoo/utils/color_constants.dart';
import 'package:ugaoo/utils/themes/custom_button_theme.dart';
import 'package:ugaoo/utils/themes/text_theme_data.dart';

import 'utils/themes/elevated_button_theme.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ugaoo',
      theme: ThemeData(
        colorSchemeSeed: ColorConstants.kBackgroundColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: CustomTextTheme(context).textTheme,
        elevatedButtonTheme:
            CustomElevatedButtonTheme(context).elevatedThemeDta,
        buttonTheme: CustomButtonTheme(context).buttomThemeData,
      ),
      home: const SplashPage(),
    );
  }
}
