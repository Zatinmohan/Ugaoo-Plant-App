part of '../../views/registration_page.dart';

class RegistrationTextWidget extends StatelessWidget {
  const RegistrationTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Register",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 0.0,
                color: ColorConstants.kPrimaryAccentColor,
              ),
        ),
        Text(
          "create your account",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: MediaQuery.sizeOf(context).width * 0.07,
                letterSpacing: 1.4,
                color: ColorConstants.kPrimaryAccentColor,
              ),
        ),
      ],
    );
  }
}