import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/utils/routes/routes_implementation.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';
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
    return MaterialApp.router(
      title: 'Ugaoo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: ColorConstants.kBackgroundColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: CustomTextTheme(context).textTheme,
        elevatedButtonTheme:
            CustomElevatedButtonTheme(context).elevatedThemeData,
        buttonTheme: CustomButtonTheme(context).buttomThemeData,
      ),
      routerConfig: Routes.instance.router,
    );
  }
}
