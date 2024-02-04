import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ugaoo/pages/profile_page/dependency_injection.dart/profile_dependency_injection.dart';
import 'package:ugaoo/pages/profile_page/models/profile_settings_model.dart';
import 'package:ugaoo/pages/profile_page/provider/profile_page_provider.dart';
import 'package:ugaoo/routes/constants/routes_name.dart';

part 'widgets/profile_page_widgets/login_profile_widget.dart';
part 'widgets/profile_page_widgets/user_info_widget.dart';
part 'widgets/custom_profile_button_widget.dart';
part 'widgets/profile_signin_widgets/profile_sign_up_widget.dart';

part 'widgets/profile_signin_widgets/login_here_widget.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late final ProfilePageProvider provider;

  @override
  void initState() {
    provider = ref.read(ProfileDependencyInjection.profileProvider);
    provider.getAppVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watchProvider = ref.watch(ProfileDependencyInjection.profileProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: 0 == 1
          ? LoginProfilePage(
              appVersion: watchProvider.appVersion ?? "",
            )
          : ProfileSignInWidget(
              appVersion: watchProvider.appVersion ?? "",
            ),
    );
  }
}
