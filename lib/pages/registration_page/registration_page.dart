import 'package:flutter/material.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'dart:math' as math;

import 'package:ugaoo/utils/color_constants.dart';

part 'widgets/registration_image_widget.dart';
part 'widgets/registration_text_widgets.dart';
part 'widgets/registration_form_widget.dart';
part 'widgets/register_button_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 3,
            child: RegistrationImageWidget(),
          ),
          SizedBox(height: 16.0),
          Flexible(
            flex: 1,
            child: RegistrationTextWidget(),
          ),
          SizedBox(height: 16.0),
          Flexible(
            flex: 4,
            child: RegistrationFormWidget(),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: const RegisterButtonWidget(),
          ),
        ],
      ),
    );
  }
}
