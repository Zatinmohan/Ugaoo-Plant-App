import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'dart:math' as math;

import 'package:ugaoo/utils/color_constants.dart';

part 'widgets/login_image_widget.dart';
part 'widgets/custom_login_button_widget.dart';

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
                const SizedBox(height: 16.0),
                CustomLoginButtonWidget(
                  buttonName: "Sign in with Google",
                  onTap: () {},
                  buttonImage: Assets.misc.gLogo.path,
                ),
                const SizedBox(height: 16.0),
                CustomLoginButtonWidget(
                  buttonName: "Sign in with Facebook",
                  onTap: () {},
                  buttonImage: Assets.misc.facebook.path,
                ),
                Platform.isIOS
                    ? const SizedBox(height: 16.0)
                    : const SizedBox.shrink(),
                Platform.isIOS
                    ? CustomLoginButtonWidget(
                        buttonName: "Sign in with Apple",
                        onTap: () {},
                        buttonImage: Assets.misc.apple.path,
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 16.0),
                CustomLoginButtonWidget(
                  buttonName: "Sign in With Email",
                  onTap: () {},
                  buttonImage: Assets.misc.email.path,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Don't have an account, Sign-up Here",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorConstants.kPrimaryAccentColor,
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
