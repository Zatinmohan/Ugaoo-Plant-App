import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/firebase_options.dart';
import 'package:ugaoo/dependency_injection/global_dependency_injections.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';
import 'package:ugaoo/utils/themes/custom_app_bar_theme.dart';
import 'package:ugaoo/utils/themes/custom_bottom_nav_theme.dart';
import 'package:ugaoo/utils/themes/custom_button_theme.dart';
import 'package:ugaoo/utils/themes/custom_text_field_theme.dart';
import 'package:ugaoo/utils/themes/snackbar_theme.dart';
import 'package:ugaoo/utils/themes/text_theme_data.dart';

import 'utils/themes/elevated_button_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(GlobalDependencyInjection.preferenceProvider);
    return data.when(
      data: (refProvider) {
        ref.watch(GlobalDependencyInjection.apiProvider);
        final route = ref.watch(GlobalDependencyInjection.routerProvider);
        return MaterialApp.router(
          title: 'Ugaoo',
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: ColorConstants.kBackgroundColor,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: CustomAppBarTheme(context).themeData,
            textTheme: CustomTextTheme(context).textTheme,
            elevatedButtonTheme:
                CustomElevatedButtonTheme(context).elevatedThemeData,
            buttonTheme: CustomButtonTheme(context).buttomThemeData,
            inputDecorationTheme: CustomInputFieldTheme(context).themeData,
            snackBarTheme:
                CustomSnackBarThemeData(context: context).snackBarThemeData,
            bottomNavigationBarTheme:
                CustomBottomNavBarTheme(context: context).themeData,
          ),
          routerConfig: route.router,
        );
      },
      error: (_, error) => const Center(child: CircularProgressIndicator()),
      loading: () {
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
