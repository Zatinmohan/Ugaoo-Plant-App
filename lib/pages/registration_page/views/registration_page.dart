import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ugaoo/gen/assets.gen.dart';
import 'package:ugaoo/routes/routes_name.dart';
import 'dart:math' as math;

import 'package:ugaoo/utils/themes/color_constants.dart';

part 'widgets/registration_image_widget.dart';
part 'widgets/registration_text_widgets.dart';
part 'widgets/registration_form_widget.dart';
part 'widgets/register_button_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: RegistrationImageWidget(),
          ),
          SizedBox(height: 12.0),
          Expanded(
            flex: 1,
            child: RegistrationTextWidget(),
          ),
          SizedBox(height: 10.0),
          Expanded(
            flex: 3,
            child: RegistrationFormWidget(),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: const RegisterButtonWidget(),
          ),
        ],
      ),
    );
  }
}



// Expanded(
//             flex: 4,
//             child: Column(
//               children: [
//                 const SizedBox(height: 8.0),
//                 RegistrationTextWidget(),
//                 const SizedBox(height: 8.0),
//                 RegistrationFormWidget(),
//                 const SizedBox(height: 12.0),
//                 RegisterButtonWidget(),
//               ],
//             ),
//           ),