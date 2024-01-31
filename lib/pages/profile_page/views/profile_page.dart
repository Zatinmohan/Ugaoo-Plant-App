import 'package:flutter/material.dart';
import 'package:ugaoo/pages/profile_page/models/profile_settings_model.dart';

part 'widgets/profile_page_widgets/login_profile_widget.dart';
part 'widgets/profile_page_widgets/user_info_widget.dart';
part 'widgets/profile_page_widgets/custom_profile_button_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: 0 == 0
          ? LoginProfilePage()
          : const SizedBox(
              height: 100,
              width: 100,
            ),
    );
  }
}
