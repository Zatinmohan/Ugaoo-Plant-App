part of '../../login_page.dart';

class LoginButtonsWidget extends ConsumerWidget {
  const LoginButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _auth = ref.watch(GlobalDependencyInjection.loginProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomLoginButtonWidget(
          buttonName: "Sign in with Google",
          onTap: () async {
            try {
              await _auth.login(status: LoginType.GOOGLE);
              context.mounted ? context.goNamed(RoutesName.HOME_PAGE) : null;
            } catch (error) {
              if (context.mounted) {
                Utilities.showSnackBar(
                  context: context,
                  message: error.toString(),
                );
              }
            }
          },
          buttonImage: Assets.misc.gLogo.path,
        ),
        const SizedBox(height: 24.0),
        CustomLoginButtonWidget(
          buttonName: "Sign in with Facebook",
          onTap: () {},
          buttonImage: Assets.misc.facebook.path,
        ),
        Platform.isIOS ? const SizedBox(height: 24.0) : const SizedBox.shrink(),
        Platform.isIOS
            ? CustomLoginButtonWidget(
                buttonName: "Sign in with Apple",
                onTap: () {},
                buttonImage: Assets.misc.apple.path,
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 24.0),
        CustomLoginButtonWidget(
          buttonName: "Sign in With Email",
          onTap: () {},
          buttonImage: Assets.misc.email.path,
        ),
      ],
    );
  }
}
