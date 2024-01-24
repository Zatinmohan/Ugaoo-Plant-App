import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'dart:math' as math;

import 'package:ugaoo/utils/themes/color_constants.dart';

part 'widgets/login_image_widget.dart';
part 'widgets/custom_login_button_widget.dart';
part 'widgets/login_buttons_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: LoginImageWidget(),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi There,",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorConstants.kPrimaryAccentColor,
                        height: 0.0,
                      ),
                ),
                Text(
                  "Please signin to continue",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorConstants.kPrimaryAccentColor,
                      ),
                ),
                const SizedBox(height: 24.0),
                const LoginButtonsWidget(),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 12.0,
                    ),
                    child: Text(
                      "Don't have an account, Sign-up Here",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorConstants.kPrimaryAccentColor,
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
