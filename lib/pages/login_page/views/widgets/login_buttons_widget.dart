part of '../../views/login_page.dart';

class LoginButtonsWidget extends StatelessWidget {
  const LoginButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomLoginButtonWidget(
          buttonName: "Sign in with Google",
          onTap: () {},
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
