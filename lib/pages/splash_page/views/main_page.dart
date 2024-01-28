import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'package:ugaoo/routes/routes_name.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Center(child: SplashTextWidget()),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.75,
            ),
            const SizedBox(
              width: double.maxFinite,
              child: SplashButtonWidgets(),
            ),
          ],
        ),
      ),
    );
  }
}
