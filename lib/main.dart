import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/pages/splash_page/main_page.dart';
import 'package:ugaoo/utils/color_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: ColorConstants.kBackgroundColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: MediaQuery.sizeOf(context).width * 0.2,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: MediaQuery.sizeOf(context).width * 0.1,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: MediaQuery.sizeOf(context).width * 0.06,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(2.0),
            minimumSize: MaterialStateProperty.all(
              Size(
                MediaQuery.sizeOf(context).width * 0.5,
                MediaQuery.sizeOf(context).width * 0.12,
              ),
            ),
            maximumSize: MaterialStateProperty.all(
              Size(
                MediaQuery.sizeOf(context).width * 0.8,
                MediaQuery.sizeOf(context).width * 0.15,
              ),
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
          minWidth: MediaQuery.sizeOf(context).width * 0.4,
          height: MediaQuery.sizeOf(context).width * 0.3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          disabledColor: ColorConstants.kDisabledButtonColor,
          hoverColor: ColorConstants.kPrimaryAccentColor,
          focusColor: ColorConstants.kPrimaryAccentColor,
          buttonColor: ColorConstants.kPrimaryAccentColor,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: ColorConstants.kPrimaryAccentColor,
            onPrimary: ColorConstants.kPrimaryTextColor,
            secondary: ColorConstants.kSecondaryAccentColor,
            onSecondary: ColorConstants.kPrimaryTextColor,
            error: ColorConstants.kErrorButtonColor,
            onError: ColorConstants.kSecondaryTextColor,
            background: ColorConstants.kPrimaryAccentColor,
            onBackground: ColorConstants.kPrimaryAccentColor,
            surface: ColorConstants.kBackgroundColor,
            onSurface: ColorConstants.kBackgroundColor,
          ),
        ),
      ),
      home: const SplashPage(),
    );
  }
}
