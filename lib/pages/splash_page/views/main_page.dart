import 'package:flutter/material.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'package:ugaoo/pages/login_page/views/login_page.dart';
import 'package:ugaoo/pages/registration_page/views/registration_page.dart';
import 'package:ugaoo/utils/color_constants.dart';

part 'widgets/splash_button_widgets.dart';
part 'widgets/text_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.misc.background.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: const SplashTextWidget(),
            ),
            Flexible(
              flex: 2,
              child: const SplashButtonWidgets(),
            ),
          ],
        ),
      ),
    );
  }
}
