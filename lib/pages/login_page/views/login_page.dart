import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'package:ugaoo/utils/routes/routes_name.dart';
import 'package:ugaoo/utils/services/auth_service/constants/login_states.dart';
import 'package:ugaoo/utils/services/auth_service/firebaes_login_services.dart';
import 'package:ugaoo/utils/services/auth_service/login_provider.dart';
import 'dart:math' as math;
import 'package:ugaoo/utils/themes/color_constants.dart';
import 'package:ugaoo/utils/utilities.dart';

part 'widgets/login_image_widget.dart';
part 'widgets/custom_login_button_widget.dart';
part 'widgets/login_buttons_widget.dart';

final loginProvider = Provider.autoDispose<LoginProvider>(
  (ref) => LoginProvider(
    service: LoginServiceWithFirebase(auth: FirebaseAuth.instance),
  ),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(flex: 2, child: LoginImageWidget()),
          const SizedBox(height: 16.0),
          Expanded(
            flex: 2,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: FittedBox(
                    child: Text(
                      "Hi There,",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ColorConstants.kPrimaryAccentColor,
                            height: 0.0,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Please sign-in to continue",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorConstants.kPrimaryAccentColor,
                          ),
                    ),
                  ),
                ),
                const Expanded(flex: 12, child: LoginButtonsWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
