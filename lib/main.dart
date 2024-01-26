import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugaoo/firebase_options.dart';
import 'package:ugaoo/utils/routes/routes_implementation.dart';
import 'package:ugaoo/utils/services/preferences/preference_provider.dart';
import 'package:ugaoo/utils/services/preferences/services/preferences.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';
import 'package:ugaoo/utils/themes/custom_button_theme.dart';
import 'package:ugaoo/utils/themes/custom_text_field_theme.dart';
import 'package:ugaoo/utils/themes/snackbar_theme.dart';
import 'package:ugaoo/utils/themes/text_theme_data.dart';

import 'utils/themes/elevated_button_theme.dart';

final preferenceProvider = FutureProvider<PreferenceProvider>((ref) async {
  return PreferenceProvider(
    service: SharedPreferenceService(
      sharedPreferences: await SharedPreferences.getInstance(),
    ),
  );
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.watch(preferenceProvider);
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
        inputDecorationTheme: CustomInputFieldTheme(context).themeData,
        snackBarTheme:
            CustomSnackBarThemeData(context: context).snackBarThemeData,
      ),
      routerConfig: Routes.instance.router,
    );
  }
}
